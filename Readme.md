<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128538243/13.1.4%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E4281)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# How to cancel ASPxGridView Callback
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e4281/)**
<!-- run online end -->


<p>This example shows how to cancel ASPxGridView Callback.</p>
<p>For this purpose we added ASPxGridView, the “Update Data Source” button, and ASPxLoadingPanel with the “Cancel” button.</p>
<p>In the beginning, there is no data in ASPxGridView. When an end-user clicks the “Update Data Source” button, data is selected from DB and stored in System.Web.Caching.Cache. We do not use the ASP.NET Session State because it synchronizes requests. For more information, go to <a href="http://msdn.microsoft.com/en-us/library/ms178581.aspx"><u>ASP.NET Session State Overview</u></a> Concurrent Requests and Session State. The key value of the Cache is a string variable. It emulates a unique user id. In a real project replace this variable with a unique value of a real user id. After that ASPxGridView is refreshed on the client side and binds to a new datasource.</p>
<p>An end-user can abort the data selecting process by clicking the “Cancel” button. In this case, data is selected from the DB but ASPxGridView will not be refreshed on the client side and will not be bound to the new datasource. ASPxGridView will work with the current datasource. When the data selecting process is finished, ASPxGridView will continue working with new data.<br><br><strong>See also:</strong><br><a href="https://www.devexpress.com/Support/Center/p/T518056">ASPxGridView - How to show a lengthy operation's progress and allow canceling such operations</a></p>

<br/>


