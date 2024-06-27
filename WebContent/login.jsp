<!DOCTYPE html>
<html>
<head>
    <title>Pagina di Login</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0;
        }
        .login-form {
            width: 300px;
            padding: 30px;
            border: 1px solid #f1f1f1;
            background: #fff;
            box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.10);
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .login-form h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        .login-form input[type="text"], .login-form input[type="password"] {
            
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            display: flex;
            margin-left: auto;
            margin-right: auto;
        }
        .login-form button[type="submit"] {
            padding: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-left: auto;
            margin-right: auto;
            border: none;
            background: #1d90e0;
            color: #fff;
        }
        
    </style>
</head>
<body>
    <div class="login-form">
        <h2>Accedi al tuo account personale</h2>
        <form action="Login" method="POST">
            <input type="text" name="email" placeholder="email" required="required">
            <input type="password" name="pwd" placeholder="Password" required="required">
            <button type="submit">Accedi</button>
        </form>
        <p>Non sei registrato? <a href="register.jsp">Clicca qui!</a></p>
    </div>
</body>
</html>