using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Configuration;
//using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getDataList();
        }
    }


    //SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-APQHN68\SQLEXPRESS;Initial Catalog=testdb;User ID=abhi;Password=1234");  




    protected void Button1_Click1(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-CI0LR3F\SQLEXPRESS;Initial Catalog=testdb;User ID=sa;Password=1234");
        con.Open();
      
        Label1.Text = "connection done";
        //Response.Write("connection made");
        con.Close();
    }

    protected void btnAddEmployee_Click1(object sender, EventArgs e)
    {
        //connetionString = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
        //cnn = new SqlConnection(connetionString);
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-CI0LR3F\SQLEXPRESS;Initial Catalog=testdb;User ID=sa;Password=1234");

        int salary = int.Parse(txtSalary.Text);
        string fname = txtFirstName.Text, lname = txtLastName.Text, phoneNo = txtPhoneNumber.Text, email = txtEmailAddress.Text;
        SqlCommand co = new SqlCommand("exec insertData '" + fname + "','" + lname + "','" + phoneNo + "','" + email + "','" + salary + "'", con);
        con.Open();
        co.ExecuteNonQuery();

        //Response.Write("Data stored");
        con.Close();

        Label1.Text = "Data stored";
        getDataList();
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtEmailAddress.Text = string.Empty;
        txtPhoneNumber.Text = string.Empty;
        txtSalary.Text = string.Empty;

    }

    void getDataList()
    {
        string cs = @"Data Source=DESKTOP-CI0LR3F\SQLEXPRESS;Initial Catalog=testdb;User ID=sa;Password=1234";
        SqlConnection con = new SqlConnection(cs);
        SqlCommand co = new SqlCommand("printData", con);
        //DataTable dt = new DataTable();
        //sd.Fill(dt);
        //GridView1.DataSource = dt;
        //GridView1.DataBind();

        con.Open();
        GridView1.DataSource = co.ExecuteReader();
        GridView1.DataBind();
        con.Close();


    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        getDataList();
    }



    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        //Response.Write(id);

        string cs = @"Data Source=DESKTOP-CI0LR3F\SQLEXPRESS;Initial Catalog=testdb;User ID=sa;Password=1234";
        SqlConnection con = new SqlConnection(cs);
        SqlCommand co = new SqlCommand("deleteData", con);

        co.CommandType = System.Data.CommandType.StoredProcedure;

        co.Parameters.AddWithValue("@id", id);
        Label1.Text = "ID No " + id + "th is deleted";
         con.Open();
        co.ExecuteNonQuery();
        
        co.Clone();
        getDataList();
    }



    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        getDataList();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-CI0LR3F\SQLEXPRESS;Initial Catalog=testdb;User ID=sa;Password=1234");

        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

        
        //string salary = (GridView1.Rows[e.RowIndex].FindControl("txtSalary") as TextBox).Text;
        string fname = (GridView1.Rows[e.RowIndex].FindControl("txtFirstName") as TextBox).Text;
        
        string lname = (GridView1.Rows[e.RowIndex].FindControl("txtLastName") as TextBox).Text;
        string phoneNo = (GridView1.Rows[e.RowIndex].FindControl("txtPhoneNumber") as TextBox).Text;    
         string email = (GridView1.Rows[e.RowIndex].FindControl("txtEmailAddress") as TextBox).Text;
        int salary = int.Parse((GridView1.Rows[e.RowIndex].FindControl("txtSalary") as TextBox).Text);


        SqlCommand co = new SqlCommand("exec updatePerson '" + id + "','" + fname + "','" + lname + "','" + phoneNo + "','" + email + "','" + salary + "'", con);
        con.Open();
        co.ExecuteNonQuery();
        con.Close();
        getDataList();
        Label1.Text = "data updated";

        GridView1.EditIndex = -1;
        //txtFirstName.Text = "";
        //txtLastName.Text = "";
        //txtEmailAddress.Text = string.Empty;
        //txtPhoneNumber.Text = string.Empty;
        //txtSalary.Text = string.Empty;
    }
}