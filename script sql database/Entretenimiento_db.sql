create table Actors
(
    Id   int identity
        constraint PK_Actors
            primary key,
    Name nvarchar(max)
)
go

create table AspNetRoles
(
    Id               nvarchar(450) not null
        constraint PK_AspNetRoles
            primary key,
    Name             nvarchar(256),
    NormalizedName   nvarchar(256),
    ConcurrencyStamp nvarchar(max)
)
go

create table AspNetRoleClaims
(
    Id         int identity
        constraint PK_AspNetRoleClaims
            primary key,
    RoleId     nvarchar(450) not null
        constraint FK_AspNetRoleClaims_AspNetRoles_RoleId
            references AspNetRoles
            on delete cascade,
    ClaimType  nvarchar(max),
    ClaimValue nvarchar(max)
)
go

create index IX_AspNetRoleClaims_RoleId
    on AspNetRoleClaims (RoleId)
go

create unique index RoleNameIndex
    on AspNetRoles (NormalizedName)
    where [NormalizedName] IS NOT NULL
go

create table AspNetUsers
(
    Id                   nvarchar(450) not null
        constraint PK_AspNetUsers
            primary key,
    UserName             nvarchar(256),
    NormalizedUserName   nvarchar(256),
    Email                nvarchar(256),
    NormalizedEmail      nvarchar(256),
    EmailConfirmed       bit           not null,
    PasswordHash         nvarchar(max),
    SecurityStamp        nvarchar(max),
    ConcurrencyStamp     nvarchar(max),
    PhoneNumber          nvarchar(max),
    PhoneNumberConfirmed bit           not null,
    TwoFactorEnabled     bit           not null,
    LockoutEnd           datetimeoffset,
    LockoutEnabled       bit           not null,
    AccessFailedCount    int           not null
)
go

create table AspNetUserClaims
(
    Id         int identity
        constraint PK_AspNetUserClaims
            primary key,
    UserId     nvarchar(450) not null
        constraint FK_AspNetUserClaims_AspNetUsers_UserId
            references AspNetUsers
            on delete cascade,
    ClaimType  nvarchar(max),
    ClaimValue nvarchar(max)
)
go

create index IX_AspNetUserClaims_UserId
    on AspNetUserClaims (UserId)
go

create table AspNetUserLogins
(
    LoginProvider       nvarchar(128) not null,
    ProviderKey         nvarchar(128) not null,
    ProviderDisplayName nvarchar(max),
    UserId              nvarchar(450) not null
        constraint FK_AspNetUserLogins_AspNetUsers_UserId
            references AspNetUsers
            on delete cascade,
    constraint PK_AspNetUserLogins
        primary key (LoginProvider, ProviderKey)
)
go

create index IX_AspNetUserLogins_UserId
    on AspNetUserLogins (UserId)
go

create table AspNetUserRoles
(
    UserId nvarchar(450) not null
        constraint FK_AspNetUserRoles_AspNetUsers_UserId
            references AspNetUsers
            on delete cascade,
    RoleId nvarchar(450) not null
        constraint FK_AspNetUserRoles_AspNetRoles_RoleId
            references AspNetRoles
            on delete cascade,
    constraint PK_AspNetUserRoles
        primary key (UserId, RoleId)
)
go

create index IX_AspNetUserRoles_RoleId
    on AspNetUserRoles (RoleId)
go

create table AspNetUserTokens
(
    UserId        nvarchar(450) not null
        constraint FK_AspNetUserTokens_AspNetUsers_UserId
            references AspNetUsers
            on delete cascade,
    LoginProvider nvarchar(128) not null,
    Name          nvarchar(128) not null,
    Value         nvarchar(max),
    constraint PK_AspNetUserTokens
        primary key (UserId, LoginProvider, Name)
)
go

create index EmailIndex
    on AspNetUsers (NormalizedEmail)
go

create unique index UserNameIndex
    on AspNetUsers (NormalizedUserName)
    where [NormalizedUserName] IS NOT NULL
go

create table Productions
(
    Id                      int identity
        constraint PK_Productions
            primary key,
    Name                    nvarchar(max),
    Release                 datetime2     not null,
    Discriminator           nvarchar(max) not null,
    DurationInMinutes       int,
    WorldwideBoxOfficeGross float,
    NumberOfEpisodes        int
)
go

create table Characters
(
    Id           int identity
        constraint PK_Characters
            primary key,
    ProductionId int not null
        constraint FK_Characters_Productions_ProductionId
            references Productions
            on delete cascade,
    Name         nvarchar(max),
    ActorId      int not null
        constraint FK_Characters_Actors_ActorId
            references Actors
            on delete cascade
)
go

create index IX_Characters_ActorId
    on Characters (ActorId)
go

create index IX_Characters_ProductionId
    on Characters (ProductionId)
go

create table Ratings
(
    Id           int identity
        constraint PK_Ratings
            primary key,
    ProductionId int not null
        constraint FK_Ratings_Productions_ProductionId
            references Productions
            on delete cascade,
    Source       nvarchar(max),
    Stars        int not null
)
go

create index IX_Ratings_ProductionId
    on Ratings (ProductionId)
go


