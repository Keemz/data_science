-- Users(User_ID, User_Name, User_Subscription,  User_email, #Follower_ID)

-- Artists(Artist_ID, Artist_Name, Record_Label_ID, Genre_type)

-- Tracks(Track_ID, Track_Name, Track_Duration, #Album_ID,#Artist_ID,#Playlist_ID) 

-- Albums(Album_ID, Album_Name, #Artist_ID, #Playlist_ID, Track_ID, Realease_Date, splash_art, Album_Duration)

-- Playlist(Playlist_ID, Playlist_Name, Playlist_Duration, #User_ID)

-- Followers(Follower_ID,  #User_ID, #Artist_ID)


-- User(User_ID, User_Name, User_Subscription,  User_email, #Follower_ID)
CREATE TABLE Users(
	User_ID VARCHAR(60) PRIMARY KEY,
	User_Name VARCHAR(50),
	User_Subscription VARCHAR(50),
	User_Email VARCHAR(15),
	Follower_ID 
	FOREIGN KEY (Follower_ID) REFERENCES Follower(Follower_ID)
);


-- Artists(Artist_ID, Artist_Name, Record_Label_ID, Genre_type)
CREATE TABLE Artist(
	Artist_ID VARCHAR(10) PRIMARY KEY,
	Artist_Name VARCHAR(50) NOT NULL,
	Record_Label VARCHAR(50) NOT NULL,
	Genre_Type VARCHAR(60) NOT NULL
);

-- Tracks(Track_ID, Track_Name, Track_Duration, #Album_ID,#Artist_ID,#Playlist_ID) 
CREATE TABLE Tracks(
	Track_ID VARCHAR(10) PRIMARY KEY,
	Track_Name VARCHAR(50) NOT NULL,
	Track_Duration INTERVAL,
	FOREIGN KEY (Album_ID) REFERENCES Album(Album_ID),
	FOREIGN KEY (Artist_ID) REFERENCES Artist(Artist_ID),
	FOREIGN KEY (Palylist_ID) REFERENCES Playlist(Playlist_ID)
);

-- Albums(Album_ID, Album_Name, #Artist_ID, #Playlist_ID, Realease_Date, splash_art, Album_Duration)
CREATE TABLE Album(
	Album_ID VARCHAR(10) PRIMARY KEY,
	Album_Name VARCHAR(50) NOT NULL,
	Release_Date DATE NOT NULL,
	Splash_Art VARCHAR(60) NOT NULl,
	Album_Duration INTERVAL,
	Team_Player VARCHAR(60) NOT NULL,
	FOREIGN KEY (Playlist_ID) REFERENCES Playlist(Playlist_ID),
	FOREIGN KEY (Artist_ID) REFERENCES Artist(Artist_ID)
);

-- Playlist(Playlist_ID, Playlist_Name, Playlist_Duration, #User_ID)
CREATE TABLE Playlist(
	Playlist_ID VARCHAR (10) PRIMARY KEY,
	Playlist_Name VARCHAR(50) NOT NULL,
	Playlist_Duration INTERVAL,
	FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);


-- Followers(Follower_ID,  #User_ID, #Artist_ID)
CREATE TABLE Follower(
	Follower_ID VARCHAR(10) PRIMARY KEY,
	FOREIGN KEY (Users_ID) REFERENCES Users(Users_ID),
	FOREIGN KEY (Artist_ID) REFERENCES Artist(Artist_ID)
);