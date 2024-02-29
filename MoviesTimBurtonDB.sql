USE moviestimburton;

INSERT INTO movies (name, year, gender, director, synopsis, image)
VALUES ('El joven manos de tijera', 1990, 'Fantasía/Drama', 'Tim Burton',
        'La historia de Edward, un joven que fue creado artificialmente y tiene cuchillas en lugar de manos.', 'https://cloudfront-us-east-1.images.arcpublishing.com/infobae/KXXZA5IT5VEQJLQO372PX6JH4Y.jpg');


INSERT INTO movies (name, year, gender, director, synopsis, image)
VALUES ('El extraño mundo de Jack', 1993, 'Animación/Fantasía', 'Tim Burton',
        'Jack Skellington, rey de Halloween Town, descubre la Navidad y decide secuestrar a Santa Claus para ocupar su lugar.', 'https://www.laizquierdadiario.com/IMG/arton211062.jpg');


INSERT INTO movies (name, year, gender, director, synopsis, image)
VALUES ('Beetlejuice', 1988, 'Comedia/Fantasía', 'Tim Burton',
        'Una joven pareja se convierte en fantasma y recurre a Beetlejuice, un exorcista para sacar a los nuevos inquilinos de su casa.', 'https://larepublica.cronosmedia.glr.pe/original/2022/03/07/6225764efbc504056b2ec62a.jpg');


INSERT INTO movies (name, year, gender, director, synopsis, image)
VALUES ('El barbero diabólico de la calle Fleet', 2007, 'Drama/Musical', 'Tim Burton',
        'Sweeney Todd busca venganza contra aquellos que arruinaron su vida, convirtiéndose en un barbero asesino en la Londres del siglo XIX.', 'https://www.phenomena-experience.com/galeria/Historico_peliculas/S/sweeney-todd-mini.jpg');

select * from movies;