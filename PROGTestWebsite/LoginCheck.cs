using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace PROGTestWebsite
{
    public class LoginCheck
    {
        //----------------------------------------------------------------Class Variables-----------------------------------------------------------//
        //All values stored in these class variables are captured by the class constructor and used throughout the class
        private string username;        //Stores the username of the current logged in user
        private string password;        //Stores the password that the user typed in on the login screen to check if the passwords match
        public int count;               //Stores the number 1 if the details match or 0 if the details do not match (username and password)        
        private string cs = Properties.Settings.Default.DBCONNECTSTRING;
        SqlConnection con;
        SqlCommand cmd;
        //----------------------------------------------------------------Class Variables-----------------------------------------------------------//

        public LoginCheck(string username, string password)
        {
            //Class constructor and its variables
            this.username = username;
            this.password = password;
        }

        public void CheckForRegisteredFarmer(string hashedPassword)
        {
            //CheckForRegisteredUser matches the username and password that the user entered to the username and password stored in the database (For a farmer)            
            using (con = new SqlConnection(cs))
            {
                con.Open();
                cmd = new SqlCommand("SELECT COUNT(1) FROM FARMER WHERE USERNAME=@username AND PASSWORD=@password", con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", hashedPassword); //Getting the hashed password

                count = Convert.ToInt32(cmd.ExecuteScalar()); //If the details match, "count" value = 1, if they dont match, "count" value = 0                
                con.Close();
            }
        }

        public void CheckForRegisteredEmployee(string hashedPassword)
        {
            //CheckForRegisteredUser matches the username and password that the user entered to the username and password stored in the database (For an employee)            
            using (con = new SqlConnection(cs))
            {
                con.Open();
                cmd = new SqlCommand("SELECT COUNT(1) FROM EMPLOYEE WHERE USERNAME=@username AND PASSWORD=@password", con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", hashedPassword); //Getting the hashed password

                count = Convert.ToInt32(cmd.ExecuteScalar()); //If the details match, "count" value = 1, if they dont match, "count" value = 0                
                con.Close();
            }
        }

        public string PasswordHashing()
        {
            //This method hashes any password that is added to the database so that no actual password values are shown
            var sha = SHA256.Create();
            var bytes = Encoding.Default.GetBytes(password);
            var hashedPassword1 = sha.ComputeHash(bytes);

            return Convert.ToBase64String(hashedPassword1);
        }
    }
}