using System;
using System.Data;
using System.Threading;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {
    private const string userID = "0bac71c1-5afb-49c3-aadc-cd825a89ce1b";
    private AccessDataSource ads;

    protected void Page_Init(object sender, EventArgs e) {
        if(!IsPostBack)
            Cache.Remove(userID);
        gv.DataSource = (DataTable)Cache.Get(userID);
        gv.DataBind();
    }

    private void InitializeDataSuorce() {
        string path = Server.MapPath("~/App_Data/NorthWind.mdb");
        const string command = "SELECT * FROM [Products]";
        ads = new AccessDataSource(path, command);
        ads.Selecting += ads_Selecting;
    }

    protected void ads_Selecting(object sender, SqlDataSourceSelectingEventArgs e) {
        // Data selecting emulation
        Thread.Sleep(5000);
    }

    protected void cb_Callback(object source, CallbackEventArgs e) {
        InitializeDataSuorce();
        Cache.Insert(userID, ((DataView)ads.Select(DataSourceSelectArguments.Empty)).Table);
    }
}