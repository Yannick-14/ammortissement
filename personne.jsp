<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Utilisateur</title>
</head>
<style>
    h1
    {
        font-size: 30px;
        font-family: "Rubik";
        
        font-weight: bold;
        margin-left: 4%;
    }
    body
    {
        margin-left: 25%;
        margin-top: 12%;
        margin-right: 40%;
        background-color: rgb(102, 100, 100);
    }
    label
    {
        font-family: "Rubik";
        margin-bottom: 2%;
    }
    input
    {
        width: 250px;
        height: 40px;
        margin-bottom: 5%;
        border-radius: 8px;
        border-style: none;
        padding-left: 4%;
        background-color: rgb(206, 206, 206);
    }
    button
    {
        width: 120px;
        height: 50px;
        border-radius: 7px;
        border-style: none;
        background-color: rgb(229, 180, 57);
        font-family:"Gentium Book Basic";
        font-size: 20px;
        color: rgb(227, 227, 227);
    }
    .retour
    {
        margin-top: 5%;
        font-family: "Frank Ruehl CLM BoldOblique";
        color: rgb(229, 180, 57);
        font-size: 20px;
    }
    .retour a
    {
        color: rgb(229, 180, 57);
        font-size: 20px;
    }
</style>
<body>
    <h1>Utilisateur</h1>
    <form action="addPers.jsp">
        <label for="">Nom:</label><br>
        <input type="text" name="nom"><br>
        <button>Ajouter</button>
    </form>
    <div class="retour">
        <a href="index.html">Retour</a>
    </div>
</body>
</html>