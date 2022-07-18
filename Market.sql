CREATE DATABASE Market;
GO

USE Market;

CREATE TABLE Products (
  Id INT IDENTITY(1,1) NOT NULL,
  Name [nvarchar](50) NOT NULL,

  CONSTRAINT [PK_Products] PRIMARY KEY (Id),
  CONSTRAINT [AK_Products] UNIQUE(Name)
);


CREATE TABLE Categories (
  Id INT IDENTITY(1,1) NOT NULL,
  Name [nvarchar](50) NOT NULL,

  CONSTRAINT [PK_Categories] PRIMARY KEY (Id),
  CONSTRAINT [AK_Categories] UNIQUE(Name)
);


CREATE TABLE ProductCategory (
  Id INT IDENTITY(1,1) NOT NULL,
  ProductId INT NOT NULL,
  CategoryId INT NOT NULL,

  CONSTRAINT [PK_ProductCategory] PRIMARY KEY (Id),
  CONSTRAINT [FK_Products] FOREIGN KEY (ProductId) REFERENCES [Products] (Id),
  CONSTRAINT [FK_Category] FOREIGN KEY (CategoryId) REFERENCES [Categories] (Id)
);
GO

INSERT INTO Products (Name)
VALUES
  ('Картофель'),
  ('Лук'),
  ('Редис'),
  ('Капуста'),
  ('Свекла'),
  ('Сыр'),
  ('Молоко'),
  ('Мясо'),
  ('Яйцо'),
  ('Творог'),
  ('Перец чёрный'),
  ('Перец красный'),
  ('Тимьян'),
  ('Куркума'),
  ('Мак'),
  ('Ваниль'),
  ('Хумус')



INSERT INTO Categories (Name)
VALUES
  ('Товары растительного происхождения'),
  ('Товары животного происхождения'),
  ('Пряности'),
  ('Специальное хранение');



INSERT INTO ProductCategory (ProductId, CategoryId)
VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 2),
	(7, 2),
	(8, 2),
	(9, 2),
	(10, 2),
	(11, 3),
	(12, 3),
	(13, 3),
	(14, 3),
	(15, 3),
	(16, 3),
	(6, 4),
	(7, 4),
	(8, 4),
	(10, 4)



SELECT p.Name, c.Name
FROM Products p
LEFT JOIN ProductCategory ON ProductCategory.ProductId = p.Id
LEFT JOIN Categories c ON ProductCategory.CategoryId = c.Id
