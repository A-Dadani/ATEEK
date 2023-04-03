# ATEEK
A seamless platform that connects customers with pharmacists.

## How to run the code locally
### Setup
Running the code is easy. 
- You need to download and install Node.JS : [Official Node.JS download link](https://nodejs.org/en/download) <br/>
- You also need python which you can install from the source: [Install python](https://www.python.org/downloads/) <br/>

Then clone the project<br/>

```
git clone https://github.com/A-Dadani/ATEEK
```

CD into the project directory

```
cd ATEEK
```

Remove remote origin

```
git remote remove origin
```
### Running the server
Install all the dependencies

```
npm install
```

Start the server

```
npm start
```
***IMPORTANT!*** <br/>
Please make sure that the Node server is running on port 5000, the project will not work otherwise.<br/>
If port 5000 is already taken kindly refer to this article on how to kill a task running on a port: [How to find and kill a process running on a port](https://community.talend.com/s/article/How-to-find-and-kill-a-process-running-on-a-port-LVJkZ?language=en_US).

The server should now be up and listening.

### Running the frontend
Make sure you're are running the commands from the project director ATEEK. Then cd into the `_public/build/web` directory.

```
cd ./_public/build/web
```

We'll use python's http.server module to serve the frontend on a *different* port than that used by the back end, we'll use port 8000

```
python -m http.server 8000
```

We're done! All that's left is to open a Chrome browser instance and go to `localhost:8000/` (If you chose to serve the front end on a different port than 8000 use that instead).

## The Stack
**Backend:** Node, Express, JavaScript<br/>
**DataBase and Auth service:** Firebase<br/>
**FrontEnd:** Flutter<br/>

## Note
The raw flutter code and the build are in the `_public` directory. The `public` folder holds the page that will be served by the backend on the route `'/'`, this page will have the documentation of the ATEEK API in the future.
