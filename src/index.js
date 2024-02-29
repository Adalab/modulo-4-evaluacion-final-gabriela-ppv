const express = require("express");
const cors = require("cors");
const mysql = require("mysql2/promise");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

// creo mi servidor

const app = express();
app.use(cors());
app.use(express.json({ limit: "25mb" }));
app.set("view engine", "ejs");
require("dotenv").config(); // esta linea va antes de que se usen las variables de entorno

// funcion que me crea la conexion con la base de datos
const connectDB = async () => {
  const connex = await mysql.createConnection({
    host: "localhost",
    user: process.env.USER_DB,
    password: process.env.USERPASS,
    database: "moviestimburton",
  });
  await connex.connect();
  console.log(`conexion establecida ${connex.threadId}`);
  return connex;
};

// inicio el servidor
const serverPort = process.env.PORT || 5001;
app.listen(serverPort, () => {
  console.log(`http://localhost:${serverPort}`);
});

// funcion que genera los token
const generateToken = (data) => {
  const token = jwt.sign(data, "secret_key", { expiresIn: "1h" });
  return token;
};

// funcion que autentica el token

const verifyToken = (token) => {
  try {
    const verifyT = jwt.verify(token, "secret_key");
    return verifyT;
  } catch (error) {
    return null;
  }
};

// funcion middleware

const authenticateToken = (req, res, next) => {
  const tokenBearer = req.headers["authorization"];

  if (!tokenBearer) {
    return res.status(401).json({ error: "No hay token" });
  }

  const token = tokenBearer.split(" ")[1];
  const validateToken = verifyToken(token);
  if (!validateToken) {
    return res.status(401).json({ error: "token incorrecto" });
  }

  req.user = validateToken;
  next();
};

// endpoint que pide todas las movies
app.get("/movies", async (req, res) => {
  try {
    const conex = await connectDB();

    const moviesSql = "select * from movies";
    const [result] = await conex.query(moviesSql);
    const numOfElements = result.length;
    res.json({
      info: { count: numOfElements },
      results: result,
    });
    conex.end();
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .json({ success: false, message: "Error al procesar la solicitud" });
  }
});

// // endpoint que busca una movie por id

app.get("/movies/:id", async (req, res) => {
  try {
    const conex = await connectDB();
    const idMovies = req.params.id;

    if (isNaN(parseInt(idMovies))) {
      return res.json({ success: false, error: "el id debe ser un numero" });
    }

    const sqlId = "select * from movies where idMovies = ?";
    const [result] = await conex.query(sqlId, [idMovies]);

    if (result.length === 0) {
      return res.json({ success: false, message: "El id no existe" });
    }
    res.json({ success: true, movies: result[0] });

    conex.end();
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .json({ success: false, message: "Error al procesar la solicitud" });
  }
});

// // endpoint para crear una nueva movie

app.post("/movies", async (req, res) => {
  try {
    const conex = await connectDB();
    const data = req.body;
    const { name, year, gender, director, synopsis, image } = data;

    if (!name || !year || !gender || !director || !synopsis || !image) {
      return res.json({
        success: false,
        message: "Todos los campos son requeridos",
      });
    }

    const selectmovie = "select * from movies where name= ?";
    const [resultSelect] = await conex.query(selectmovie, [name]);

    if (resultSelect.length === 0) {
      const sqlInsert =
        "insert into movies (name, year, gender, director, synopsis, image) values (?,?,?,?,?,?)";
      const [result] = await conex.query(sqlInsert, [
        name,
        year,
        gender,
        director,
        synopsis,
        image,
      ]);
      res.json({
        success: true,
        id: result.insertId,
      });
    } else {
      res.json({ success: false, message: "La pelicula ya existe" });
    }

    conex.end();
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .json({ success: false, message: "Error al procesar la solicitud" });
  }
});

// endpoint que filtra los datos por nombre

app.get("/movies/name/:name", async (req, res) => {
  try {
    const conex = await connectDB();
    const name = req.params.name;

    const sqlSelect = "select * from movies where name =?";
    const [result] = await conex.query(sqlSelect, [name]);

    if (result.length === 0) {
      return res.json({
        success: false,
        message: "No se encontro ninguna pelicula, con ese nombre.",
      });
    }

    res.json({ success: true, movie: result[0] });
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .json({ success: false, message: "Error al procesar la solicitud" });
  }
});

// endpoint para actualizar una movie existente

app.put("/movies/:id", async (req, res) => {
  try {
    const conex = await connectDB();
    const id = req.params.id;
    const data = req.body;
    const { name, year, gender, director, synopsis, image } = data;

    const [existeMovie] = await conex.query(
      "select * from movies where idMovies=?",
      [id]
    );
    if (existeMovie.length === 0) {
      return res.json({
        success: false,
        message: "La pelicula no se encontro",
      });
    }

    if (!name || !year || !gender || !director || !synopsis || !image) {
      return res.json({
        success: false,
        message: "Todos los campos son requeridos",
      });
    }

    const sqlAdd =
      "update movies  set name = ?, year = ?, gender =?, director = ?, synopsis =?, image=? where idMovies = ?";
    const [result] = await conex.query(sqlAdd, [
      name,
      year,
      gender,
      director,
      synopsis,
      image,
      id,
    ]);
    res.json({ success: true, message: "actualizada correctamente" });

    conex.end();
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .json({ success: false, message: "Error al procesar la solicitud" });
  }
});

//  endpoint que elimina una movie

app.delete("/movies", async (req, res) => {
  try {
    const conex = await connectDB();
    const idMovie = req.query.id;

    const sqlDelete = "delete from movies where idMovies = ?";
    const [result] = await conex.query(sqlDelete, [idMovie]);
    if (result.affectedRows > 0) {
      res.json({
        success: true,
        message: "Eliminado correctamente",
      });
    } else {
      res.json({
        success: false,
        message: "no se ha eliminado, ya que no existe",
      });
    }
    conex.end();
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .json({ success: false, message: "Error al procesar la solicitud" });
  }
});

// endpoint que registra un usuario

app.post("/register", async (req, res) => {
  try {
    const conex = await connectDB();
    const { email, nombre, direccion, password } = req.body;
    const selectUser = "select * from user where email=? ";
    const [resultSelect] = await conex.query(selectUser, [email]);

    if (resultSelect.length === 0) {
      const passwordHashed = await bcrypt.hash(password, 10);

      const insertUser =
        "insert into user (email,nombre,direccion,password) values(?,?,?,?)";

      const [resultInsert] = await conex.query(insertUser, [
        email,
        nombre,
        direccion,
        passwordHashed,
      ]);
      res.json({ success: true, data: resultInsert });
    } else {
      res.json({ success: false, message: "El usuario ya esta registrado" });
    }
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .json({ success: false, message: "Error al procesar la solicitud" });
  }
});

// endpoint login

app.post("/login", async (req, res) => {
  try {
    const conex = await connectDB();
    const { email, password } = req.body;
    const selectUser = "select * from user where email =?";
    const [resultSelect] = await conex.query(selectUser, [email]);

    if (resultSelect.length !== 0) {
      const isOkPass = await bcrypt.compare(password, resultSelect[0].password);
      if (isOkPass) {
        const infoToken = {
          id: resultSelect[0].id,
          email: resultSelect[0].email,
        };
        const token = generateToken(infoToken);
        res.json({ success: true, token: token });
      } else {
        res.json({
          success: false,
          message: "contraseña incorrecta",
        });
      }
    } else {
      res.json({
        success: false,
        msj: "correo no existe",
      });
    }
  } catch (error) {
    console.log(error);
    res
      .status(500)
      .json({ success: false, message: "Error al procesar la solicitud" });
  }
});

// endpoint autenticar

app.get("/profileUser", authenticateToken, async (req, res) => {
  console.log(req.user);
  const sql = "select * from user where email =?";
  const conex = await connectDB();
  const [results] = await conex.query(sql, [req.user.email]);

  conex.end();
  res.json({ success: true, user: results });
});

// endpoint cierre de sesion

app.put("/logout", (req, res) => {
  const tokenHeader = req.headers["authorization"];
  jwt.sign(
    { data: "" },
    "secret_key",
    { expiresIn: 1 },
    (error, logoutToken) => {
      if (!error) {
        res.json({ message: "Sesion cerrada Exitosamente" });
      } else {
        res.json({ message: "Ha ocurrido un error, intentalo nuevamente" });
      }
    }
  );
});
