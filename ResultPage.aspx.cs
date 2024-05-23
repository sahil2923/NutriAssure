using System;
using System.Web.UI;

namespace project_registration
{
    public partial class ResultPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["ResultMessage"] != null)
                {
                    // Retrieve the result message from the session
                    string resultMessage = Session["ResultMessage"].ToString();

                    // Display the result message
                    ResultMessageLiteral.Text = resultMessage;

                    // Remove the session variable after displaying the message (optional)
                    Session.Remove("ResultMessage");
                }
                else
                {
                    // If the result message is not available in the session, display a default message
                    ResultMessageLiteral.Text = "Result information not available.";
                }
            }
        }
    }
}
