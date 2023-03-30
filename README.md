# ATEEK
A seamless platform that connects customers with pharmacists.

## How to run the code locally
Running the code is easy. You need to download and install Node.JS : [Official Node.JS download link](https://nodejs.org/en/download)<br/>
Then clone the project<br/>
```git clone https://github.com/A-Dadani/ATEEK```<br/>
CD into the project directory<br/>
```cd ATEEK```<br/>
Remove remote origin<br/>
```git remote remove origin```<br/>
Install all the dependencies<br/>
```npm install```<br/>
Start the server<br/>
```npm start```<br/>

All that's left is to open a Chrome browser instance and go to `localhost:5000/` (The 5000 is the default port number. Make sure to change it if the server is listening on a different port)

## The Stack
**Backend:** Node, Express, JavaScript<br/>
**DataBase and Auth service:** Firebase<br/>
**FrontEnd:** Flutter<br/>

## Note
The `_public` folder holds the raw flutter code, the `public` folder holds the built frontend, and the rest of the files are for the Node Server.
