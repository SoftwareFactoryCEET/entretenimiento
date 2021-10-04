IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(128) NOT NULL,
        [ProviderKey] nvarchar(128) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(128) NOT NULL,
        [Name] nvarchar(128) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'00000000000000_CreateIdentitySchema', N'5.0.10');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    CREATE TABLE [Actors] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        CONSTRAINT [PK_Actors] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    CREATE TABLE [Productions] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [Release] datetime2 NOT NULL,
        [Discriminator] nvarchar(max) NOT NULL,
        [DurationInMinutes] int NULL,
        [WorldwideBoxOfficeGross] float NULL,
        [NumberOfEpisodes] int NULL,
        CONSTRAINT [PK_Productions] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    CREATE TABLE [Characters] (
        [Id] int NOT NULL IDENTITY,
        [ProductionId] int NOT NULL,
        [Name] nvarchar(max) NULL,
        [ActorId] int NOT NULL,
        CONSTRAINT [PK_Characters] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Characters_Actors_ActorId] FOREIGN KEY ([ActorId]) REFERENCES [Actors] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Characters_Productions_ProductionId] FOREIGN KEY ([ProductionId]) REFERENCES [Productions] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    CREATE TABLE [Ratings] (
        [Id] int NOT NULL IDENTITY,
        [ProductionId] int NOT NULL,
        [Source] nvarchar(max) NULL,
        [Stars] int NOT NULL,
        CONSTRAINT [PK_Ratings] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Ratings_Productions_ProductionId] FOREIGN KEY ([ProductionId]) REFERENCES [Productions] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[Actors]'))
        SET IDENTITY_INSERT [Actors] ON;
    EXEC(N'INSERT INTO [Actors] ([Id], [Name])
    VALUES (1, N''Robert Downey Jr.''),
    (18, N''Melissa McBride''),
    (17, N''Norman Reedus''),
    (16, N''Hazuki Shimizu''),
    (15, N''Matsuya Onoe''),
    (13, N''Winona Ryder''),
    (12, N''Caleb McLaughlin''),
    (11, N''Millie Bobby Brown''),
    (10, N''Karyn Parsons''),
    (14, N''David Harbour''),
    (8, N''Maggie Smith''),
    (7, N''Will Smith''),
    (6, N''Donny Yen''),
    (5, N''Beyoncé''),
    (4, N''Donald Glover''),
    (3, N''Danai Guira''),
    (2, N''Chris Evans''),
    (9, N''Michelle Dockery'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Name') AND [object_id] = OBJECT_ID(N'[Actors]'))
        SET IDENTITY_INSERT [Actors] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Discriminator', N'Name', N'NumberOfEpisodes', N'Release') AND [object_id] = OBJECT_ID(N'[Productions]'))
        SET IDENTITY_INSERT [Productions] ON;
    EXEC(N'INSERT INTO [Productions] ([Id], [Discriminator], [Name], [NumberOfEpisodes], [Release])
    VALUES (8, N''Series'', N''Stranger Things'', 34, ''2016-07-11T00:00:00.0000000''),
    (7, N''Series'', N''Downton Abbey'', 52, ''2010-09-26T00:00:00.0000000''),
    (6, N''Series'', N''The Fresh Prince of Bel-Air'', 148, ''1990-09-10T00:00:00.0000000'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Discriminator', N'Name', N'NumberOfEpisodes', N'Release') AND [object_id] = OBJECT_ID(N'[Productions]'))
        SET IDENTITY_INSERT [Productions] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Discriminator', N'DurationInMinutes', N'Name', N'Release', N'WorldwideBoxOfficeGross') AND [object_id] = OBJECT_ID(N'[Productions]'))
        SET IDENTITY_INSERT [Productions] ON;
    EXEC(N'INSERT INTO [Productions] ([Id], [Discriminator], [DurationInMinutes], [Name], [Release], [WorldwideBoxOfficeGross])
    VALUES (5, N''Movie'', 120, N''Downton Abbey'', ''2020-09-20T00:00:00.0000000'', 194051302.0E0),
    (1, N''Movie'', 181, N''Avengers: Endgame'', ''2019-04-26T00:00:00.0000000'', 2797800564.0E0),
    (3, N''Movie'', 105, N''Ip Man 4'', ''2019-12-25T00:00:00.0000000'', 192617891.0E0),
    (2, N''Movie'', 118, N''The Lion King'', ''2019-07-19T00:00:00.0000000'', 1654791102.0E0)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Discriminator', N'DurationInMinutes', N'Name', N'Release', N'WorldwideBoxOfficeGross') AND [object_id] = OBJECT_ID(N'[Productions]'))
        SET IDENTITY_INSERT [Productions] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Discriminator', N'Name', N'NumberOfEpisodes', N'Release') AND [object_id] = OBJECT_ID(N'[Productions]'))
        SET IDENTITY_INSERT [Productions] ON;
    EXEC(N'INSERT INTO [Productions] ([Id], [Discriminator], [Name], [NumberOfEpisodes], [Release])
    VALUES (9, N''Series'', N''Kantaro: The Sweet Tooth Salaryman'', 12, ''2017-07-14T00:00:00.0000000'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Discriminator', N'Name', N'NumberOfEpisodes', N'Release') AND [object_id] = OBJECT_ID(N'[Productions]'))
        SET IDENTITY_INSERT [Productions] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Discriminator', N'DurationInMinutes', N'Name', N'Release', N'WorldwideBoxOfficeGross') AND [object_id] = OBJECT_ID(N'[Productions]'))
        SET IDENTITY_INSERT [Productions] ON;
    EXEC(N'INSERT INTO [Productions] ([Id], [Discriminator], [DurationInMinutes], [Name], [Release], [WorldwideBoxOfficeGross])
    VALUES (4, N''Movie'', 116, N''Gemini Man'', ''2019-11-20T00:00:00.0000000'', 166623705.0E0)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Discriminator', N'DurationInMinutes', N'Name', N'Release', N'WorldwideBoxOfficeGross') AND [object_id] = OBJECT_ID(N'[Productions]'))
        SET IDENTITY_INSERT [Productions] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Discriminator', N'Name', N'NumberOfEpisodes', N'Release') AND [object_id] = OBJECT_ID(N'[Productions]'))
        SET IDENTITY_INSERT [Productions] ON;
    EXEC(N'INSERT INTO [Productions] ([Id], [Discriminator], [Name], [NumberOfEpisodes], [Release])
    VALUES (10, N''Series'', N''The Walking Dead'', 177, ''2010-10-31T00:00:00.0000000'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Discriminator', N'Name', N'NumberOfEpisodes', N'Release') AND [object_id] = OBJECT_ID(N'[Productions]'))
        SET IDENTITY_INSERT [Productions] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ActorId', N'Name', N'ProductionId') AND [object_id] = OBJECT_ID(N'[Characters]'))
        SET IDENTITY_INSERT [Characters] ON;
    EXEC(N'INSERT INTO [Characters] ([Id], [ActorId], [Name], [ProductionId])
    VALUES (1, 1, N''Tony Stark'', 1),
    (6, 6, N''Ip Man'', 3),
    (7, 7, N''Henry Brogan'', 4),
    (8, 8, N''Violet Crawley'', 5),
    (9, 9, N''Lady Mary Crawley'', 5),
    (10, 7, N''Will Smith'', 6),
    (12, 8, N''Violet Crawley'', 7),
    (13, 9, N''Lady Mary Crawley'', 7),
    (5, 5, N''Nala'', 2),
    (14, 11, N''Eleven'', 8),
    (16, 13, N''Joyce Byers'', 8),
    (17, 14, N''Jim Hopper'', 8),
    (18, 15, N''Ametani Kantarou'', 9),
    (19, 16, N''Sano Erika'', 9),
    (20, 17, N''Daryl Dixon'', 10),
    (21, 3, N''Michonne'', 10),
    (22, 18, N''Carol Peletier'', 10),
    (15, 12, N''Lucas'', 8),
    (4, 4, N''Simba'', 2),
    (11, 10, N''Hilary Banks'', 6),
    (2, 2, N''Steve Rogers'', 1),
    (3, 3, N''Okoye'', 1)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ActorId', N'Name', N'ProductionId') AND [object_id] = OBJECT_ID(N'[Characters]'))
        SET IDENTITY_INSERT [Characters] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (18, 1, N''App'', 4),
    (666, 7, N''Internet'', 2),
    (667, 7, N''Internet'', 4),
    (668, 7, N''Internet'', 2),
    (669, 7, N''App'', 3),
    (670, 7, N''Newspaper'', 2),
    (671, 7, N''Newspaper'', 4),
    (672, 7, N''Magazine'', 4),
    (673, 7, N''Internet'', 3),
    (674, 7, N''Internet'', 3),
    (675, 7, N''Newspaper'', 1),
    (676, 7, N''Internet'', 2),
    (665, 7, N''Internet'', 3),
    (677, 7, N''Newspaper'', 4),
    (679, 7, N''Internet'', 5),
    (680, 7, N''Newspaper'', 2),
    (681, 7, N''App'', 3),
    (682, 7, N''Internet'', 5),
    (683, 7, N''Newspaper'', 1),
    (684, 7, N''Newspaper'', 2)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (685, 7, N''Magazine'', 5),
    (686, 7, N''Internet'', 3),
    (687, 7, N''Newspaper'', 2),
    (688, 7, N''Newspaper'', 1),
    (689, 7, N''Internet'', 3),
    (690, 7, N''Internet'', 2),
    (691, 7, N''Magazine'', 2),
    (678, 7, N''Internet'', 4),
    (664, 7, N''App'', 4),
    (663, 7, N''App'', 2),
    (662, 7, N''App'', 4),
    (636, 7, N''Magazine'', 5),
    (637, 7, N''Internet'', 4),
    (638, 7, N''Internet'', 2),
    (639, 7, N''Magazine'', 4),
    (640, 7, N''Magazine'', 3),
    (641, 7, N''Newspaper'', 4),
    (642, 7, N''Magazine'', 2),
    (643, 7, N''Internet'', 4),
    (644, 7, N''App'', 5),
    (645, 7, N''App'', 2),
    (646, 7, N''App'', 1),
    (647, 7, N''App'', 1),
    (692, 7, N''Internet'', 4),
    (648, 7, N''Internet'', 3),
    (650, 7, N''Magazine'', 1),
    (651, 7, N''Magazine'', 2),
    (652, 7, N''Newspaper'', 1),
    (653, 7, N''Internet'', 2),
    (654, 7, N''Newspaper'', 3),
    (655, 7, N''Magazine'', 1),
    (656, 7, N''Internet'', 3),
    (657, 7, N''Internet'', 3),
    (658, 7, N''Internet'', 5),
    (659, 7, N''Newspaper'', 5),
    (660, 7, N''Magazine'', 5),
    (661, 7, N''Internet'', 4),
    (649, 7, N''Magazine'', 4),
    (693, 7, N''Internet'', 4),
    (694, 7, N''Newspaper'', 3),
    (695, 7, N''Internet'', 2),
    (725, 8, N''Newspaper'', 2)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (726, 8, N''App'', 4),
    (727, 8, N''App'', 4),
    (728, 8, N''Newspaper'', 3),
    (729, 8, N''App'', 1),
    (730, 8, N''Newspaper'', 1),
    (731, 8, N''Magazine'', 1),
    (732, 8, N''Magazine'', 5),
    (733, 8, N''Internet'', 3),
    (734, 8, N''Internet'', 4),
    (735, 8, N''Magazine'', 2),
    (736, 8, N''App'', 4),
    (737, 8, N''App'', 3),
    (738, 8, N''App'', 3),
    (739, 8, N''Newspaper'', 5),
    (740, 8, N''Newspaper'', 4),
    (741, 8, N''App'', 3),
    (742, 8, N''Internet'', 1),
    (743, 8, N''Magazine'', 4),
    (744, 8, N''Internet'', 3),
    (745, 8, N''Internet'', 1),
    (746, 8, N''Magazine'', 1),
    (747, 8, N''App'', 2),
    (748, 8, N''Magazine'', 2),
    (749, 8, N''Magazine'', 4),
    (750, 8, N''Internet'', 5),
    (751, 8, N''Internet'', 1),
    (724, 8, N''Magazine'', 2),
    (723, 8, N''App'', 1),
    (722, 8, N''Newspaper'', 1),
    (721, 8, N''Newspaper'', 2),
    (696, 7, N''Internet'', 2),
    (697, 7, N''App'', 3),
    (698, 7, N''App'', 5),
    (699, 7, N''App'', 3),
    (7, 1, N''Internet'', 4),
    (6, 1, N''Newspaper'', 3),
    (5, 1, N''Internet'', 1),
    (4, 1, N''Internet'', 4),
    (701, 8, N''Internet'', 3),
    (702, 8, N''Internet'', 4),
    (703, 8, N''Newspaper'', 1),
    (704, 8, N''Newspaper'', 5)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (705, 8, N''Internet'', 1),
    (635, 7, N''Newspaper'', 4),
    (706, 8, N''Newspaper'', 2),
    (708, 8, N''Internet'', 5),
    (709, 8, N''App'', 1),
    (710, 8, N''App'', 1),
    (711, 8, N''Internet'', 2),
    (712, 8, N''App'', 5),
    (713, 8, N''App'', 1),
    (714, 8, N''Newspaper'', 2),
    (715, 8, N''Newspaper'', 3),
    (716, 8, N''Internet'', 3),
    (717, 8, N''Magazine'', 5),
    (718, 8, N''Newspaper'', 3),
    (719, 8, N''Internet'', 3),
    (720, 8, N''Newspaper'', 2),
    (707, 8, N''App'', 4),
    (634, 7, N''Internet'', 1),
    (632, 7, N''Magazine'', 1),
    (752, 8, N''Magazine'', 2),
    (544, 6, N''Internet'', 2),
    (545, 6, N''Internet'', 5),
    (546, 6, N''Magazine'', 5),
    (547, 6, N''Newspaper'', 1),
    (548, 6, N''Internet'', 2),
    (549, 6, N''Newspaper'', 3),
    (550, 6, N''Magazine'', 1),
    (551, 6, N''Internet'', 2),
    (552, 6, N''Internet'', 5),
    (553, 6, N''App'', 4),
    (554, 6, N''Internet'', 2),
    (555, 6, N''Magazine'', 3),
    (556, 6, N''Internet'', 5),
    (557, 6, N''Newspaper'', 3),
    (558, 6, N''App'', 5),
    (559, 6, N''Newspaper'', 3),
    (560, 6, N''App'', 1),
    (561, 6, N''Internet'', 2),
    (562, 6, N''Newspaper'', 2),
    (563, 6, N''Magazine'', 2),
    (564, 6, N''Internet'', 1),
    (565, 6, N''Internet'', 1)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (566, 6, N''Newspaper'', 3),
    (567, 6, N''App'', 2),
    (568, 6, N''Newspaper'', 4),
    (569, 6, N''Magazine'', 4),
    (570, 6, N''Internet'', 3),
    (543, 6, N''Internet'', 5),
    (571, 6, N''Internet'', 4),
    (542, 6, N''Newspaper'', 4),
    (540, 6, N''App'', 2),
    (513, 6, N''Internet'', 3),
    (514, 6, N''App'', 5),
    (515, 6, N''App'', 2),
    (516, 6, N''Internet'', 4),
    (517, 6, N''Magazine'', 1),
    (518, 6, N''Magazine'', 4),
    (519, 6, N''Newspaper'', 3),
    (520, 6, N''App'', 4),
    (521, 6, N''Newspaper'', 2),
    (522, 6, N''Internet'', 3),
    (523, 6, N''Magazine'', 1),
    (524, 6, N''Newspaper'', 3),
    (525, 6, N''Internet'', 2),
    (526, 6, N''App'', 5),
    (527, 6, N''App'', 4),
    (528, 6, N''Magazine'', 4),
    (529, 6, N''App'', 4),
    (530, 6, N''Newspaper'', 2),
    (531, 6, N''Internet'', 3),
    (532, 6, N''Internet'', 4),
    (533, 6, N''Magazine'', 5),
    (534, 6, N''Newspaper'', 2),
    (535, 6, N''Internet'', 3),
    (536, 6, N''Internet'', 2),
    (537, 6, N''Newspaper'', 3),
    (538, 6, N''Internet'', 2),
    (539, 6, N''Newspaper'', 4),
    (541, 6, N''Magazine'', 3),
    (633, 7, N''Magazine'', 5),
    (572, 6, N''Newspaper'', 4),
    (574, 6, N''Magazine'', 2),
    (605, 7, N''Newspaper'', 1),
    (606, 7, N''Internet'', 1)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (607, 7, N''Magazine'', 5),
    (608, 7, N''App'', 2),
    (609, 7, N''Newspaper'', 3),
    (610, 7, N''Magazine'', 1),
    (611, 7, N''App'', 4),
    (612, 7, N''Magazine'', 3),
    (613, 7, N''Newspaper'', 5),
    (614, 7, N''Internet'', 1),
    (615, 7, N''Magazine'', 4),
    (616, 7, N''Newspaper'', 3),
    (617, 7, N''App'', 1),
    (618, 7, N''App'', 1),
    (619, 7, N''App'', 1),
    (620, 7, N''Internet'', 3),
    (621, 7, N''Magazine'', 2),
    (622, 7, N''App'', 1),
    (623, 7, N''Newspaper'', 1),
    (624, 7, N''Magazine'', 3),
    (625, 7, N''Internet'', 5),
    (626, 7, N''Newspaper'', 5),
    (627, 7, N''Newspaper'', 3),
    (628, 7, N''Internet'', 4),
    (629, 7, N''Internet'', 5),
    (630, 7, N''Magazine'', 4),
    (631, 7, N''Internet'', 3),
    (604, 7, N''App'', 2),
    (573, 6, N''Magazine'', 1),
    (603, 7, N''Magazine'', 5),
    (601, 7, N''Newspaper'', 1),
    (575, 6, N''Newspaper'', 2),
    (576, 6, N''Internet'', 4),
    (577, 6, N''Internet'', 2),
    (578, 6, N''Internet'', 2),
    (579, 6, N''Magazine'', 5),
    (580, 6, N''Internet'', 4),
    (581, 6, N''Internet'', 4),
    (582, 6, N''Newspaper'', 1),
    (583, 6, N''Magazine'', 2),
    (584, 6, N''Magazine'', 5),
    (585, 6, N''Magazine'', 4),
    (586, 6, N''App'', 2),
    (587, 6, N''App'', 5)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (588, 6, N''Internet'', 1),
    (589, 6, N''Internet'', 2),
    (590, 6, N''App'', 2),
    (591, 6, N''Newspaper'', 3),
    (592, 6, N''Magazine'', 5),
    (593, 6, N''Newspaper'', 3),
    (594, 6, N''Internet'', 1),
    (595, 6, N''Newspaper'', 3),
    (596, 6, N''Internet'', 3),
    (597, 6, N''Newspaper'', 1),
    (598, 6, N''Magazine'', 3),
    (599, 6, N''Newspaper'', 5),
    (9, 1, N''Newspaper'', 4),
    (8, 1, N''App'', 2),
    (602, 7, N''Magazine'', 4),
    (753, 8, N''App'', 4),
    (754, 8, N''App'', 3),
    (755, 8, N''Magazine'', 2),
    (910, 10, N''Magazine'', 3),
    (911, 10, N''App'', 4),
    (912, 10, N''Internet'', 5),
    (913, 10, N''Magazine'', 1),
    (914, 10, N''Magazine'', 2),
    (915, 10, N''Internet'', 1),
    (916, 10, N''Internet'', 5),
    (917, 10, N''Newspaper'', 5),
    (918, 10, N''App'', 1),
    (919, 10, N''Newspaper'', 4),
    (920, 10, N''Internet'', 5),
    (921, 10, N''Magazine'', 1),
    (909, 10, N''Newspaper'', 4),
    (922, 10, N''Magazine'', 2),
    (924, 10, N''App'', 1),
    (925, 10, N''Magazine'', 2),
    (926, 10, N''App'', 2),
    (927, 10, N''Magazine'', 5),
    (928, 10, N''App'', 5),
    (929, 10, N''Internet'', 2),
    (930, 10, N''Magazine'', 3),
    (931, 10, N''App'', 1),
    (932, 10, N''Internet'', 5),
    (933, 10, N''App'', 3)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (934, 10, N''Internet'', 2),
    (935, 10, N''Magazine'', 4),
    (923, 10, N''Internet'', 2),
    (908, 10, N''Internet'', 3),
    (907, 10, N''Magazine'', 4),
    (906, 10, N''Internet'', 1),
    (879, 9, N''Magazine'', 3),
    (880, 9, N''Magazine'', 2),
    (881, 9, N''App'', 4),
    (882, 9, N''Newspaper'', 1),
    (883, 9, N''App'', 4),
    (884, 9, N''Newspaper'', 3),
    (885, 9, N''Magazine'', 2),
    (886, 9, N''App'', 3),
    (887, 9, N''Newspaper'', 1),
    (888, 9, N''Internet'', 3),
    (889, 9, N''App'', 1),
    (890, 9, N''Internet'', 1),
    (891, 9, N''Internet'', 5),
    (892, 9, N''Newspaper'', 3),
    (893, 9, N''Magazine'', 3),
    (894, 9, N''Newspaper'', 5),
    (895, 9, N''Magazine'', 2),
    (896, 9, N''App'', 3),
    (897, 9, N''Internet'', 4),
    (898, 9, N''Newspaper'', 3),
    (899, 9, N''Magazine'', 2),
    (1, 1, N''App'', 3),
    (901, 10, N''Newspaper'', 4),
    (902, 10, N''Magazine'', 3),
    (903, 10, N''Newspaper'', 2),
    (904, 10, N''App'', 3),
    (905, 10, N''Newspaper'', 2),
    (936, 10, N''Newspaper'', 3),
    (937, 10, N''Newspaper'', 3),
    (938, 10, N''Internet'', 4),
    (939, 10, N''Newspaper'', 4),
    (971, 10, N''Magazine'', 4),
    (972, 10, N''App'', 2),
    (973, 10, N''Newspaper'', 1),
    (974, 10, N''Newspaper'', 1),
    (975, 10, N''Newspaper'', 2)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (976, 10, N''Newspaper'', 4),
    (977, 10, N''Magazine'', 4),
    (978, 10, N''App'', 4),
    (979, 10, N''App'', 3),
    (980, 10, N''Internet'', 2),
    (981, 10, N''Internet'', 4),
    (982, 10, N''Magazine'', 3),
    (983, 10, N''Newspaper'', 2),
    (984, 10, N''Magazine'', 4),
    (985, 10, N''Newspaper'', 2),
    (986, 10, N''App'', 2),
    (987, 10, N''Magazine'', 1),
    (988, 10, N''Internet'', 4),
    (989, 10, N''Magazine'', 4),
    (990, 10, N''App'', 1),
    (991, 10, N''Internet'', 5),
    (992, 10, N''App'', 5),
    (993, 10, N''App'', 4),
    (994, 10, N''Magazine'', 1),
    (995, 10, N''Newspaper'', 5),
    (996, 10, N''Magazine'', 1),
    (997, 10, N''Internet'', 2),
    (970, 10, N''App'', 2),
    (878, 9, N''Magazine'', 2),
    (969, 10, N''Magazine'', 2),
    (967, 10, N''Magazine'', 2),
    (940, 10, N''App'', 5),
    (941, 10, N''Newspaper'', 3),
    (942, 10, N''Newspaper'', 2),
    (943, 10, N''Internet'', 5),
    (944, 10, N''Newspaper'', 2),
    (945, 10, N''Newspaper'', 4),
    (946, 10, N''Newspaper'', 2),
    (947, 10, N''Newspaper'', 5),
    (948, 10, N''Internet'', 1),
    (949, 10, N''Internet'', 4),
    (950, 10, N''Newspaper'', 1),
    (951, 10, N''App'', 4),
    (952, 10, N''Magazine'', 1),
    (953, 10, N''Internet'', 1),
    (954, 10, N''Magazine'', 2),
    (955, 10, N''Magazine'', 5)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (956, 10, N''Internet'', 1),
    (957, 10, N''Magazine'', 2),
    (958, 10, N''Magazine'', 1),
    (959, 10, N''Newspaper'', 3),
    (960, 10, N''Newspaper'', 2),
    (961, 10, N''App'', 4),
    (962, 10, N''Newspaper'', 3),
    (963, 10, N''Internet'', 2),
    (964, 10, N''Internet'', 2),
    (965, 10, N''Newspaper'', 2),
    (966, 10, N''Magazine'', 2),
    (968, 10, N''Magazine'', 1),
    (877, 9, N''Magazine'', 4),
    (876, 9, N''Magazine'', 5),
    (875, 9, N''App'', 5),
    (787, 8, N''Newspaper'', 2),
    (788, 8, N''Internet'', 5),
    (789, 8, N''Newspaper'', 5),
    (790, 8, N''Internet'', 5),
    (791, 8, N''Internet'', 3),
    (792, 8, N''Magazine'', 3),
    (793, 8, N''Newspaper'', 3),
    (794, 8, N''App'', 4),
    (795, 8, N''Magazine'', 5),
    (796, 8, N''Newspaper'', 1),
    (797, 8, N''Magazine'', 1),
    (798, 8, N''Internet'', 3),
    (799, 8, N''Newspaper'', 1),
    (3, 1, N''App'', 4),
    (2, 1, N''App'', 3),
    (801, 9, N''Internet'', 2),
    (802, 9, N''Internet'', 2),
    (803, 9, N''Newspaper'', 5),
    (804, 9, N''Internet'', 1),
    (805, 9, N''Internet'', 3),
    (806, 9, N''Magazine'', 5),
    (807, 9, N''App'', 4),
    (808, 9, N''Internet'', 2),
    (809, 9, N''Internet'', 2),
    (810, 9, N''App'', 2),
    (811, 9, N''App'', 5),
    (812, 9, N''Internet'', 4)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (786, 8, N''Internet'', 5),
    (813, 9, N''Internet'', 3),
    (785, 8, N''Magazine'', 4),
    (783, 8, N''Newspaper'', 2),
    (756, 8, N''Magazine'', 4),
    (757, 8, N''Magazine'', 1),
    (758, 8, N''Newspaper'', 5),
    (759, 8, N''Magazine'', 3),
    (760, 8, N''Internet'', 1),
    (761, 8, N''Magazine'', 3),
    (762, 8, N''Internet'', 5),
    (763, 8, N''Internet'', 3),
    (764, 8, N''Magazine'', 4),
    (765, 8, N''App'', 3),
    (766, 8, N''Newspaper'', 2),
    (767, 8, N''Magazine'', 4),
    (768, 8, N''Newspaper'', 1),
    (769, 8, N''Newspaper'', 3),
    (770, 8, N''Magazine'', 2),
    (771, 8, N''Magazine'', 1),
    (772, 8, N''Magazine'', 4),
    (773, 8, N''Newspaper'', 2),
    (774, 8, N''Magazine'', 4),
    (775, 8, N''App'', 1),
    (776, 8, N''App'', 2),
    (777, 8, N''App'', 3),
    (778, 8, N''Magazine'', 4),
    (779, 8, N''Internet'', 1),
    (780, 8, N''Magazine'', 2),
    (781, 8, N''App'', 2),
    (782, 8, N''Newspaper'', 3),
    (784, 8, N''Newspaper'', 1),
    (512, 6, N''Newspaper'', 3),
    (814, 9, N''Magazine'', 3),
    (816, 9, N''Magazine'', 5),
    (848, 9, N''App'', 5),
    (849, 9, N''Internet'', 2),
    (850, 9, N''Magazine'', 2),
    (851, 9, N''Magazine'', 4),
    (852, 9, N''Newspaper'', 4),
    (853, 9, N''Newspaper'', 3),
    (854, 9, N''Magazine'', 2)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (855, 9, N''App'', 5),
    (856, 9, N''Newspaper'', 3),
    (857, 9, N''App'', 5),
    (858, 9, N''App'', 3),
    (859, 9, N''App'', 1),
    (860, 9, N''Magazine'', 2),
    (861, 9, N''App'', 3),
    (862, 9, N''Internet'', 1),
    (863, 9, N''App'', 1),
    (864, 9, N''Newspaper'', 4),
    (865, 9, N''Newspaper'', 3),
    (866, 9, N''Magazine'', 1),
    (867, 9, N''Magazine'', 5),
    (868, 9, N''App'', 3),
    (869, 9, N''Internet'', 3),
    (870, 9, N''Internet'', 4),
    (871, 9, N''Newspaper'', 2),
    (872, 9, N''Newspaper'', 5),
    (873, 9, N''Internet'', 1),
    (874, 9, N''Magazine'', 5),
    (847, 9, N''Newspaper'', 2),
    (815, 9, N''Magazine'', 1),
    (846, 9, N''Magazine'', 2),
    (844, 9, N''Magazine'', 5),
    (817, 9, N''Magazine'', 5),
    (818, 9, N''App'', 1),
    (819, 9, N''Internet'', 4),
    (820, 9, N''Internet'', 2),
    (821, 9, N''Newspaper'', 3),
    (822, 9, N''Magazine'', 5),
    (823, 9, N''Newspaper'', 5),
    (824, 9, N''Newspaper'', 4),
    (825, 9, N''App'', 5),
    (826, 9, N''Newspaper'', 2),
    (827, 9, N''Internet'', 5),
    (828, 9, N''Newspaper'', 2),
    (829, 9, N''Internet'', 3),
    (830, 9, N''App'', 5),
    (831, 9, N''Magazine'', 1),
    (832, 9, N''Magazine'', 1),
    (833, 9, N''Internet'', 2),
    (834, 9, N''Internet'', 4)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (835, 9, N''Magazine'', 4),
    (836, 9, N''Internet'', 3),
    (837, 9, N''Newspaper'', 5),
    (838, 9, N''Magazine'', 2),
    (839, 9, N''Internet'', 5),
    (840, 9, N''Internet'', 2),
    (841, 9, N''Internet'', 2),
    (842, 9, N''Internet'', 3),
    (843, 9, N''Magazine'', 2),
    (845, 9, N''Magazine'', 1),
    (511, 6, N''Internet'', 2),
    (510, 6, N''Magazine'', 2),
    (509, 6, N''Newspaper'', 3),
    (173, 2, N''Magazine'', 2),
    (174, 2, N''Magazine'', 5),
    (175, 2, N''Magazine'', 3),
    (176, 2, N''Newspaper'', 5),
    (177, 2, N''Magazine'', 2),
    (178, 2, N''Magazine'', 5),
    (179, 2, N''Magazine'', 4),
    (180, 2, N''Internet'', 4),
    (181, 2, N''Internet'', 1),
    (182, 2, N''Magazine'', 2),
    (183, 2, N''App'', 5),
    (184, 2, N''Internet'', 3),
    (185, 2, N''Internet'', 5),
    (186, 2, N''Internet'', 4),
    (187, 2, N''Internet'', 2),
    (188, 2, N''Internet'', 3),
    (189, 2, N''Newspaper'', 1),
    (190, 2, N''App'', 3),
    (191, 2, N''Newspaper'', 1),
    (192, 2, N''App'', 1),
    (193, 2, N''Internet'', 5),
    (194, 2, N''Newspaper'', 1),
    (195, 2, N''Newspaper'', 3),
    (196, 2, N''Magazine'', 5),
    (197, 2, N''Newspaper'', 5),
    (198, 2, N''Internet'', 2),
    (199, 2, N''Newspaper'', 4),
    (172, 2, N''Internet'', 5),
    (14, 1, N''Magazine'', 5)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (171, 2, N''Internet'', 2),
    (169, 2, N''Magazine'', 1),
    (142, 2, N''Newspaper'', 5),
    (143, 2, N''Internet'', 4),
    (144, 2, N''Internet'', 5),
    (145, 2, N''Magazine'', 3),
    (146, 2, N''App'', 1),
    (147, 2, N''Internet'', 3),
    (148, 2, N''Newspaper'', 3),
    (149, 2, N''App'', 1),
    (150, 2, N''Newspaper'', 3),
    (151, 2, N''Internet'', 4),
    (152, 2, N''Newspaper'', 2),
    (153, 2, N''Newspaper'', 1),
    (154, 2, N''App'', 4),
    (155, 2, N''Newspaper'', 2),
    (156, 2, N''Newspaper'', 2),
    (157, 2, N''App'', 4),
    (158, 2, N''App'', 4),
    (159, 2, N''App'', 4),
    (160, 2, N''App'', 4),
    (161, 2, N''App'', 2),
    (162, 2, N''Magazine'', 3),
    (163, 2, N''Internet'', 4),
    (164, 2, N''Magazine'', 1),
    (165, 2, N''Magazine'', 3),
    (166, 2, N''Newspaper'', 3),
    (167, 2, N''Magazine'', 5),
    (168, 2, N''Magazine'', 1),
    (170, 2, N''Newspaper'', 3),
    (141, 2, N''Newspaper'', 5),
    (201, 3, N''Newspaper'', 1),
    (203, 3, N''Newspaper'', 4),
    (235, 3, N''Internet'', 5),
    (236, 3, N''Magazine'', 5),
    (237, 3, N''Internet'', 5),
    (238, 3, N''Newspaper'', 4),
    (239, 3, N''App'', 3),
    (240, 3, N''App'', 1),
    (241, 3, N''Newspaper'', 4),
    (242, 3, N''Internet'', 3),
    (243, 3, N''Internet'', 3)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (244, 3, N''Newspaper'', 1),
    (245, 3, N''App'', 1),
    (246, 3, N''App'', 2),
    (247, 3, N''Magazine'', 1),
    (248, 3, N''App'', 3),
    (249, 3, N''Internet'', 4),
    (250, 3, N''Internet'', 4),
    (251, 3, N''App'', 3),
    (252, 3, N''Newspaper'', 4),
    (253, 3, N''App'', 2),
    (254, 3, N''Internet'', 4),
    (255, 3, N''Newspaper'', 2),
    (256, 3, N''App'', 1),
    (257, 3, N''Newspaper'', 5),
    (258, 3, N''App'', 3),
    (259, 3, N''Newspaper'', 3),
    (260, 3, N''Internet'', 4),
    (261, 3, N''App'', 5),
    (234, 3, N''App'', 2),
    (202, 3, N''Magazine'', 2),
    (233, 3, N''App'', 2),
    (231, 3, N''App'', 2),
    (204, 3, N''Magazine'', 5),
    (205, 3, N''Internet'', 5),
    (206, 3, N''App'', 1),
    (207, 3, N''Internet'', 3),
    (208, 3, N''Magazine'', 1),
    (209, 3, N''Magazine'', 5),
    (210, 3, N''Magazine'', 5),
    (211, 3, N''Magazine'', 4),
    (212, 3, N''Internet'', 4),
    (213, 3, N''Magazine'', 4),
    (214, 3, N''Internet'', 1),
    (215, 3, N''App'', 2),
    (216, 3, N''Internet'', 5),
    (217, 3, N''App'', 3),
    (218, 3, N''App'', 2),
    (219, 3, N''Newspaper'', 4),
    (220, 3, N''App'', 4),
    (221, 3, N''Internet'', 5),
    (222, 3, N''App'', 2),
    (223, 3, N''App'', 1)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (224, 3, N''Magazine'', 4),
    (225, 3, N''Internet'', 3),
    (226, 3, N''Magazine'', 3),
    (227, 3, N''Internet'', 2),
    (228, 3, N''Newspaper'', 4),
    (229, 3, N''Internet'', 4),
    (230, 3, N''Internet'', 1),
    (232, 3, N''Internet'', 3),
    (262, 3, N''Internet'', 4),
    (140, 2, N''Magazine'', 5),
    (138, 2, N''Magazine'', 1),
    (50, 1, N''Magazine'', 2),
    (51, 1, N''Internet'', 5),
    (52, 1, N''Newspaper'', 5),
    (53, 1, N''App'', 1),
    (54, 1, N''Magazine'', 2),
    (55, 1, N''Magazine'', 1),
    (56, 1, N''Newspaper'', 2),
    (57, 1, N''Newspaper'', 5),
    (58, 1, N''Magazine'', 2),
    (59, 1, N''App'', 3),
    (60, 1, N''Internet'', 4),
    (61, 1, N''App'', 3),
    (62, 1, N''Newspaper'', 3),
    (63, 1, N''App'', 1),
    (64, 1, N''App'', 2),
    (65, 1, N''Newspaper'', 1),
    (66, 1, N''Newspaper'', 2),
    (67, 1, N''Newspaper'', 1),
    (68, 1, N''Newspaper'', 1),
    (69, 1, N''Internet'', 3),
    (70, 1, N''Newspaper'', 1),
    (71, 1, N''App'', 3),
    (72, 1, N''Newspaper'', 3),
    (73, 1, N''App'', 4),
    (74, 1, N''Internet'', 4),
    (75, 1, N''Magazine'', 1),
    (76, 1, N''App'', 4),
    (49, 1, N''App'', 4),
    (77, 1, N''Internet'', 1),
    (48, 1, N''Internet'', 2),
    (46, 1, N''Newspaper'', 2)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (19, 1, N''App'', 2),
    (20, 1, N''Newspaper'', 1),
    (21, 1, N''App'', 1),
    (22, 1, N''App'', 5),
    (23, 1, N''Newspaper'', 4),
    (24, 1, N''Magazine'', 2),
    (25, 1, N''Magazine'', 5),
    (26, 1, N''Newspaper'', 4),
    (27, 1, N''Magazine'', 1),
    (28, 1, N''Newspaper'', 3),
    (29, 1, N''App'', 4),
    (30, 1, N''App'', 3),
    (31, 1, N''Internet'', 1),
    (32, 1, N''Internet'', 1),
    (33, 1, N''App'', 4),
    (34, 1, N''Newspaper'', 2),
    (35, 1, N''Newspaper'', 3),
    (36, 1, N''App'', 3),
    (37, 1, N''Newspaper'', 2),
    (38, 1, N''Internet'', 3),
    (39, 1, N''Newspaper'', 1),
    (40, 1, N''Internet'', 1),
    (41, 1, N''Newspaper'', 3),
    (42, 1, N''Newspaper'', 4),
    (43, 1, N''Magazine'', 2),
    (44, 1, N''Magazine'', 3),
    (45, 1, N''Internet'', 4),
    (47, 1, N''Newspaper'', 3),
    (139, 2, N''Newspaper'', 2),
    (78, 1, N''Internet'', 1),
    (80, 1, N''Internet'', 2),
    (111, 2, N''Magazine'', 5),
    (112, 2, N''Internet'', 5),
    (113, 2, N''Internet'', 3),
    (114, 2, N''Internet'', 5),
    (115, 2, N''App'', 2),
    (116, 2, N''Newspaper'', 4),
    (117, 2, N''Magazine'', 2),
    (118, 2, N''App'', 1),
    (119, 2, N''Internet'', 2),
    (120, 2, N''Magazine'', 3),
    (121, 2, N''Newspaper'', 5)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (122, 2, N''Newspaper'', 2),
    (123, 2, N''Magazine'', 2),
    (124, 2, N''Magazine'', 2),
    (125, 2, N''App'', 2),
    (126, 2, N''Newspaper'', 5),
    (127, 2, N''Newspaper'', 4),
    (128, 2, N''Magazine'', 1),
    (129, 2, N''Magazine'', 5),
    (130, 2, N''Magazine'', 4),
    (131, 2, N''Newspaper'', 2),
    (132, 2, N''Newspaper'', 2),
    (133, 2, N''Internet'', 1),
    (134, 2, N''Internet'', 1),
    (135, 2, N''App'', 2),
    (136, 2, N''Magazine'', 4),
    (137, 2, N''App'', 4),
    (110, 2, N''Internet'', 3),
    (79, 1, N''Newspaper'', 3),
    (109, 2, N''Newspaper'', 5),
    (107, 2, N''Newspaper'', 4),
    (81, 1, N''Newspaper'', 4),
    (82, 1, N''Magazine'', 3),
    (83, 1, N''Internet'', 1),
    (84, 1, N''Magazine'', 1),
    (85, 1, N''App'', 2),
    (86, 1, N''Internet'', 1),
    (87, 1, N''Newspaper'', 4),
    (88, 1, N''Magazine'', 3),
    (89, 1, N''Internet'', 3),
    (90, 1, N''Internet'', 4),
    (91, 1, N''Newspaper'', 2),
    (92, 1, N''Newspaper'', 5),
    (93, 1, N''Magazine'', 4),
    (94, 1, N''App'', 1),
    (95, 1, N''Internet'', 1),
    (96, 1, N''Internet'', 5),
    (97, 1, N''App'', 5),
    (98, 1, N''Internet'', 4),
    (99, 1, N''App'', 2),
    (16, 1, N''Newspaper'', 2),
    (15, 1, N''Internet'', 5),
    (101, 2, N''Magazine'', 1)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (102, 2, N''Internet'', 5),
    (103, 2, N''Internet'', 4),
    (104, 2, N''Newspaper'', 3),
    (105, 2, N''Magazine'', 1),
    (106, 2, N''Newspaper'', 3),
    (108, 2, N''Internet'', 5),
    (263, 3, N''Internet'', 5),
    (264, 3, N''Newspaper'', 3),
    (265, 3, N''App'', 4),
    (421, 5, N''Internet'', 5),
    (422, 5, N''Magazine'', 5),
    (423, 5, N''App'', 4),
    (424, 5, N''Newspaper'', 1),
    (425, 5, N''Internet'', 5),
    (426, 5, N''App'', 3),
    (427, 5, N''Magazine'', 3),
    (428, 5, N''Newspaper'', 1),
    (429, 5, N''App'', 3),
    (430, 5, N''Newspaper'', 3),
    (431, 5, N''App'', 4),
    (432, 5, N''Newspaper'', 3),
    (433, 5, N''Newspaper'', 5),
    (434, 5, N''Newspaper'', 2),
    (435, 5, N''Internet'', 5),
    (436, 5, N''App'', 4),
    (437, 5, N''Internet'', 5),
    (438, 5, N''Newspaper'', 5),
    (439, 5, N''Internet'', 5),
    (440, 5, N''Magazine'', 5),
    (441, 5, N''Internet'', 4),
    (442, 5, N''Newspaper'', 1),
    (443, 5, N''Newspaper'', 1),
    (444, 5, N''Magazine'', 4),
    (445, 5, N''App'', 2),
    (446, 5, N''App'', 5),
    (447, 5, N''Newspaper'', 4),
    (420, 5, N''Internet'', 4),
    (448, 5, N''Internet'', 4),
    (419, 5, N''Internet'', 3),
    (417, 5, N''Newspaper'', 1),
    (391, 4, N''App'', 1),
    (392, 4, N''App'', 2)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (393, 4, N''Magazine'', 1),
    (394, 4, N''Internet'', 4),
    (395, 4, N''Magazine'', 2),
    (396, 4, N''Internet'', 2),
    (397, 4, N''Newspaper'', 3),
    (398, 4, N''Magazine'', 2),
    (399, 4, N''Magazine'', 3),
    (12, 1, N''Magazine'', 2),
    (11, 1, N''Internet'', 5),
    (401, 5, N''Internet'', 1),
    (402, 5, N''Internet'', 2),
    (403, 5, N''Internet'', 1),
    (404, 5, N''Internet'', 5),
    (405, 5, N''Internet'', 4),
    (406, 5, N''Magazine'', 2),
    (407, 5, N''App'', 4),
    (408, 5, N''Newspaper'', 3),
    (409, 5, N''Magazine'', 5),
    (410, 5, N''App'', 2),
    (411, 5, N''App'', 3),
    (412, 5, N''Magazine'', 4),
    (413, 5, N''App'', 3),
    (414, 5, N''App'', 3),
    (415, 5, N''Newspaper'', 3),
    (416, 5, N''Internet'', 2),
    (418, 5, N''Newspaper'', 1),
    (390, 4, N''App'', 3),
    (449, 5, N''Magazine'', 3),
    (451, 5, N''Magazine'', 3),
    (483, 5, N''Internet'', 4),
    (484, 5, N''Newspaper'', 2),
    (485, 5, N''Newspaper'', 3),
    (486, 5, N''Newspaper'', 5),
    (487, 5, N''App'', 2),
    (488, 5, N''Newspaper'', 5),
    (489, 5, N''Magazine'', 4),
    (490, 5, N''Magazine'', 4),
    (491, 5, N''Internet'', 1),
    (492, 5, N''Newspaper'', 2),
    (493, 5, N''Magazine'', 3),
    (494, 5, N''Magazine'', 4),
    (495, 5, N''Newspaper'', 5)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (496, 5, N''Internet'', 3),
    (497, 5, N''Newspaper'', 5),
    (498, 5, N''App'', 1),
    (499, 5, N''Internet'', 2),
    (10, 1, N''Magazine'', 4),
    (998, 10, N''Magazine'', 2),
    (501, 6, N''Internet'', 5),
    (502, 6, N''Magazine'', 2),
    (503, 6, N''Magazine'', 3),
    (504, 6, N''Internet'', 1),
    (505, 6, N''Magazine'', 1),
    (506, 6, N''Newspaper'', 4),
    (507, 6, N''Internet'', 5),
    (508, 6, N''App'', 4),
    (482, 5, N''App'', 5),
    (450, 5, N''Newspaper'', 5),
    (481, 5, N''Magazine'', 3),
    (479, 5, N''Newspaper'', 4),
    (452, 5, N''Magazine'', 3),
    (453, 5, N''Magazine'', 3),
    (454, 5, N''Newspaper'', 5),
    (455, 5, N''Magazine'', 4),
    (456, 5, N''Newspaper'', 2),
    (457, 5, N''Magazine'', 5),
    (458, 5, N''Magazine'', 3),
    (459, 5, N''Internet'', 4),
    (460, 5, N''Newspaper'', 2),
    (461, 5, N''Magazine'', 4),
    (462, 5, N''Internet'', 1),
    (463, 5, N''App'', 2),
    (464, 5, N''Newspaper'', 1),
    (465, 5, N''App'', 3),
    (466, 5, N''Internet'', 5),
    (467, 5, N''Magazine'', 2),
    (468, 5, N''Internet'', 2),
    (469, 5, N''Newspaper'', 3),
    (470, 5, N''Newspaper'', 5),
    (471, 5, N''Newspaper'', 3),
    (472, 5, N''Magazine'', 5),
    (473, 5, N''Newspaper'', 2),
    (474, 5, N''App'', 5),
    (475, 5, N''Internet'', 5)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (476, 5, N''Newspaper'', 2),
    (477, 5, N''Newspaper'', 3),
    (478, 5, N''App'', 4),
    (480, 5, N''Newspaper'', 3),
    (389, 4, N''Internet'', 5),
    (388, 4, N''Magazine'', 4),
    (387, 4, N''Magazine'', 5),
    (297, 3, N''Magazine'', 4),
    (298, 3, N''Newspaper'', 2),
    (299, 3, N''Magazine'', 3),
    (13, 1, N''App'', 3),
    (301, 4, N''App'', 2),
    (302, 4, N''App'', 2),
    (303, 4, N''Magazine'', 4),
    (304, 4, N''Internet'', 2),
    (305, 4, N''Magazine'', 3),
    (306, 4, N''Internet'', 2),
    (307, 4, N''Magazine'', 5),
    (308, 4, N''App'', 1),
    (309, 4, N''Magazine'', 4),
    (310, 4, N''Newspaper'', 5),
    (311, 4, N''App'', 5),
    (312, 4, N''Magazine'', 1),
    (313, 4, N''Magazine'', 2),
    (314, 4, N''Internet'', 1),
    (315, 4, N''Internet'', 4),
    (316, 4, N''Internet'', 4),
    (317, 4, N''Newspaper'', 3),
    (318, 4, N''Newspaper'', 3),
    (319, 4, N''Magazine'', 2),
    (320, 4, N''App'', 5),
    (321, 4, N''Newspaper'', 4),
    (322, 4, N''Internet'', 1),
    (323, 4, N''Newspaper'', 1),
    (296, 3, N''Internet'', 3),
    (324, 4, N''App'', 3),
    (295, 3, N''Newspaper'', 4),
    (293, 3, N''Magazine'', 3),
    (266, 3, N''Internet'', 4),
    (267, 3, N''App'', 1),
    (268, 3, N''App'', 1),
    (269, 3, N''Internet'', 4)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (270, 3, N''Magazine'', 4),
    (271, 3, N''App'', 4),
    (272, 3, N''App'', 1),
    (273, 3, N''Newspaper'', 4),
    (274, 3, N''App'', 5),
    (275, 3, N''Magazine'', 1),
    (276, 3, N''Internet'', 2),
    (277, 3, N''Magazine'', 3),
    (278, 3, N''Magazine'', 2),
    (279, 3, N''Magazine'', 2),
    (280, 3, N''Internet'', 3),
    (281, 3, N''Internet'', 2),
    (282, 3, N''Newspaper'', 3),
    (283, 3, N''App'', 3),
    (284, 3, N''Internet'', 5),
    (285, 3, N''Magazine'', 1),
    (286, 3, N''Newspaper'', 2),
    (287, 3, N''App'', 4),
    (288, 3, N''Internet'', 3),
    (289, 3, N''App'', 5),
    (290, 3, N''Magazine'', 3),
    (291, 3, N''Magazine'', 2),
    (292, 3, N''App'', 2),
    (294, 3, N''Newspaper'', 4),
    (325, 4, N''App'', 5),
    (326, 4, N''Magazine'', 5),
    (327, 4, N''Internet'', 3),
    (360, 4, N''App'', 1),
    (361, 4, N''Internet'', 4),
    (362, 4, N''Internet'', 5),
    (363, 4, N''Internet'', 5),
    (364, 4, N''Internet'', 2),
    (365, 4, N''Newspaper'', 4),
    (366, 4, N''Internet'', 3),
    (367, 4, N''Magazine'', 1),
    (368, 4, N''Internet'', 1),
    (369, 4, N''App'', 1),
    (370, 4, N''Magazine'', 3),
    (371, 4, N''Internet'', 2),
    (372, 4, N''Magazine'', 2),
    (373, 4, N''Internet'', 3),
    (374, 4, N''Newspaper'', 5)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (375, 4, N''App'', 5),
    (376, 4, N''Magazine'', 2),
    (377, 4, N''Internet'', 3),
    (378, 4, N''Magazine'', 1),
    (379, 4, N''App'', 1),
    (380, 4, N''Internet'', 2),
    (381, 4, N''Magazine'', 2),
    (382, 4, N''Magazine'', 4),
    (383, 4, N''Newspaper'', 4),
    (384, 4, N''App'', 4),
    (385, 4, N''Magazine'', 3),
    (386, 4, N''Internet'', 1),
    (359, 4, N''Newspaper'', 1),
    (358, 4, N''Newspaper'', 5),
    (357, 4, N''Magazine'', 3),
    (356, 4, N''Magazine'', 3),
    (328, 4, N''Newspaper'', 3),
    (329, 4, N''App'', 4),
    (330, 4, N''Internet'', 3),
    (331, 4, N''Internet'', 3),
    (332, 4, N''Newspaper'', 2),
    (333, 4, N''Internet'', 5),
    (334, 4, N''Magazine'', 4),
    (335, 4, N''Magazine'', 1),
    (336, 4, N''Newspaper'', 3),
    (337, 4, N''Internet'', 5),
    (338, 4, N''Magazine'', 5),
    (339, 4, N''Internet'', 5),
    (340, 4, N''App'', 3),
    (17, 1, N''Newspaper'', 1),
    (341, 4, N''Internet'', 1),
    (343, 4, N''App'', 2),
    (344, 4, N''Newspaper'', 3),
    (345, 4, N''Internet'', 4),
    (346, 4, N''Newspaper'', 4),
    (347, 4, N''App'', 1),
    (348, 4, N''Newspaper'', 2),
    (349, 4, N''Magazine'', 1),
    (350, 4, N''App'', 1),
    (351, 4, N''App'', 4),
    (352, 4, N''Newspaper'', 5),
    (353, 4, N''Magazine'', 2)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] ON;
    EXEC(N'INSERT INTO [Ratings] ([Id], [ProductionId], [Source], [Stars])
    VALUES (354, 4, N''Newspaper'', 4),
    (355, 4, N''Internet'', 1),
    (342, 4, N''App'', 1),
    (999, 10, N''App'', 1)');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ProductionId', N'Source', N'Stars') AND [object_id] = OBJECT_ID(N'[Ratings]'))
        SET IDENTITY_INSERT [Ratings] OFF;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    CREATE INDEX [IX_Characters_ActorId] ON [Characters] ([ActorId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    CREATE INDEX [IX_Characters_ProductionId] ON [Characters] ([ProductionId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    CREATE INDEX [IX_Ratings_ProductionId] ON [Ratings] ([ProductionId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20211003150813_InitialCreate')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20211003150813_InitialCreate', N'5.0.10');
END;
GO

COMMIT;
GO

