<!DOCTYPE html>
<html>
<head>
    <title>Pagina di Registrazione</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0;
        }
        .register-form {
            width: 300px;
            padding: 30px;
            border: 1px solid #f1f1f1;
            background: #fff;
            box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.10);
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .register-form h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        .register-form input[type="text"], .register-form input[type="password"] {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            display: flex;
            margin-left: auto;
            margin-right: auto;
        }
        .register-form button[type="submit"] {
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
    <div class="register-form">
        <h2>Crea un nuovo account</h2>
        <form action="Register" method="post">
            <input type="text" name="name" placeholder="Nome" required="required">
            <input type="text" name="surname" placeholder="Cognome" required="required">
            <input type="text" name="email" placeholder="Email" required="required">
            <input type="password" name="pwd" placeholder="Password" required="required">
            <button type="submit">Registrati</button>
        </form>
        <p>Hai già un account? <a href="login.jsp">Accedi qui!</a></p>
    </div>
</body>
</html>
