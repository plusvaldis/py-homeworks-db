CREATE TABLE Genre (
GenreID SERIAL PRIMARY KEY,
name VARCHAR(30) NOT null
);

CREATE TABLE Executor (
ExecutorID SERIAL PRIMARY KEY,
name VARCHAR(30) NOT null
);

CREATE TABLE Album (
AlbumID SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
year DATE not null
);

CREATE TABLE Collection (
CollectionID SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
year DATE not null
);

CREATE TABLE ExeGe (
GenreID INTEGER REFERENCES Genre(GenreID),
ExecutorID INTEGER REFERENCES Executor(ExecutorID),
constraint ExeGeID primary key (GenreID, ExecutorID)
);

CREATE TABLE ExeA (
ExecutorID INTEGER REFERENCES Executor(ExecutorID),
AlbumID INTEGER REFERENCES Album(AlbumID),
constraint ExeAID primary key (ExecutorID, AlbumID)
);

CREATE TABLE Track ( 
TrackID SERIAL PRIMARY KEY,
AlbumID INTEGER NOT NULL REFERENCES Album(AlbumID),
Name VARCHAR(30) NOT NULL,
Duration INTEGER NOT null
);

CREATE TABLE ExeC (
TrackID INTEGER REFERENCES Track(TrackID),
CollectionID INTEGER REFERENCES Collection(CollectionID),
constraint ExeCID primary key (TrackID, CollectionID)
);

insert into Genre values
(1, 'pop'),
(2, 'rap'),
(3, 'minimal'),
(4, 'techno')

insert into executor values
(1, 'Jonatah'),
(2, 'Smith'),
(3, 'Fill'),
(4, 'Lick')

insert into album values
(1, 'album number one', '2021-01-08'),
(2, 'album number two', '2019-05-11'),
(3, 'album number three', '2011-02-01')

insert into track values
(1, 3, 'silinium track', 124),
(2, 1, 'lucky track name', 231),
(3, 2, 'disc tra', 211),
(4, 2, 'lilck ass', 111),
(5, 1, 'foo bar name', 112),
(6, 1, 'good maa', 212)

insert into collection values
(1, 'collection 2021', '2021-01-08'),
(2, 'collection 2019', '2019-05-11'),
(3, 'collection 2011', '2011-02-01'),
(4, 'collection 2025', '2025-01-01')

insert into exege values
(1, 2),
(2, 3),
(3, 1),
(4, 4),
(4, 1)

insert into exea values
(1, 1),
(3, 2),
(4, 3),
(2, 2)

inserпt into "exec" values
(1, 3),
(2, 1),
(3, 2),
(4, 2),
(5, 1),
(6, 1)