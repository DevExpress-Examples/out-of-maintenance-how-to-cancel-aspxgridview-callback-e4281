Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Threading
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private Const userID As String = "0bac71c1-5afb-49c3-aadc-cd825a89ce1b"
	Private ads As AccessDataSource

	Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
		If (Not IsPostBack) Then
			Cache.Remove(userID)
		End If
		gv.DataSource = CType(Cache.Get(userID), DataTable)
		gv.DataBind()
	End Sub

	Private Sub InitializeDataSuorce()
		Dim path As String = Server.MapPath("~/App_Data/NorthWind.mdb")
		Const command As String = "SELECT * FROM [Products]"
		ads = New AccessDataSource(path, command)
		AddHandler ads.Selecting, AddressOf ads_Selecting
	End Sub

	Protected Sub ads_Selecting(ByVal sender As Object, ByVal e As SqlDataSourceSelectingEventArgs)
		' Data selecting emulation
		Thread.Sleep(5000)
	End Sub

	Protected Sub cb_Callback(ByVal source As Object, ByVal e As CallbackEventArgs)
		InitializeDataSuorce()
		Cache.Insert(userID, (CType(ads.Select(DataSourceSelectArguments.Empty), DataView)).Table)
	End Sub
End Class