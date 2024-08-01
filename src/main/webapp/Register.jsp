<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<script>
function validate() {
    var fullname = document.form.fullname.value;
    var email = document.form.email.value;
    var username = document.form.username.value; 
    var password = document.form.password.value;
    var conpassword = document.form.conpassword.value;

    if (!fullname) { 
        alert("Full Name can't be blank"); 
        return false; 
    }
    else if (!email || !/^\S+@\S+\.\S+$/.test(email)) { 
        alert("Please enter a valid email address"); 
        return false; 
    }
    else if (!username) { 
        alert("Username can't be blank"); 
        return false; 
    }
    else if (password.length < 6) { 
        alert("Password must be at least 6 characters long."); 
        return false; 
    } 
    else if (password !== conpassword) { 
        alert("Confirm Password should match with the Password"); 
        return false; 
    } 
    return true;
}
</script>
</head>
<body>
<center><h2>Java Registration Application using MVC and MySQL</h2></center>
    <form name="form" action="RegisterServlet" method="post" onsubmit="return validate()">
        <table align="center">
            <tr>
                <td>Full Name</td>
                <td><input type="text" name="fullname" required /></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="email" name="email" required /></td>
            </tr>
            <tr>
                <td>Username</td>
                <td><input type="text" name="username" required /></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password" minlength="6" required /></td>
            </tr>
            <tr>
                <td>Confirm Password</td>
                <td><input type="password" name="conpassword" minlength="6" required /></td>
            </tr>
            <tr>
                <td colspan="2" style="color: red;">
                    <%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="Register" />
                    <input type="reset" value="Reset" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
