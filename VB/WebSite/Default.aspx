<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>How to cancel ASPxGridView Callback</title>
	<style>
		.dialog-table
		{
			margin: 7px 0 3px 0;
			text-align: center;
			width: 200px;
		}

		.dialog-text
		{
			text-align: center;
		}

		.dialog-button
		{
			margin: 3px auto;
			width: 70px;
		}
	</style>
	<script type="text/javascript">
		var IsCancelled = false;

		function update_OnClick(s, e) {
			IsCancelled = false;
			cb.PerformCallback();
			lp.ShowInElementByID("gv");
		}

		function cb_OnCallbackComplete(s, e) {
			if (!IsCancelled)
				gv.Refresh();
		}

		function gv_EndCallback(s, e) {
			lp.Hide();
		}

		function cancel_OnClick(s, e) {
			IsCancelled = true;
			lp.Hide();
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<dx:ASPxButton ID="updateBtn" runat="server" Text="Update Data Source" AutoPostBack="false">
			<ClientSideEvents Click="update_OnClick" />
		</dx:ASPxButton>
		<dx:ASPxCallback ID="cb" runat="server" OnCallback="cb_Callback">
			<ClientSideEvents CallbackComplete="cb_OnCallbackComplete" />
		</dx:ASPxCallback>
		<dx:ASPxLoadingPanel ID="lp" ClientInstanceName="lp" runat="server" ShowImage="true"
			Modal="true" Width="200">
			<Template>
				<table class="dialog-table">
					<tr>
						<td class="dialog-text">Database is being prepared.<br />
							Please wait...
						</td>
					</tr>
					<tr>
						<td>
							<div class="dialog-button">
								<dx:ASPxButton ID="cancelBtn" runat="server" Text="Cancel" AutoPostBack="false" Width="70">
									<ClientSideEvents Click="cancel_OnClick" />
								</dx:ASPxButton>
							</div>
						</td>
					</tr>
				</table>
			</Template>
		</dx:ASPxLoadingPanel>
		<dx:ASPxGridView ID="gv" ClientInstanceName="gv" runat="server" AutoGenerateColumns="False"
			KeyFieldName="ProductID">
			<ClientSideEvents EndCallback="gv_EndCallback" />
			<Columns>
				<dx:GridViewDataTextColumn FieldName="ProductID" VisibleIndex="1"
					ReadOnly="True">
					<EditFormSettings Visible="False" />
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="2">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="SupplierID" VisibleIndex="3">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="4">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="QuantityPerUnit" VisibleIndex="5">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="6">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="7">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="UnitsOnOrder" VisibleIndex="8">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="ReorderLevel" VisibleIndex="9">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataCheckColumn FieldName="Discontinued" VisibleIndex="10">
				</dx:GridViewDataCheckColumn>
				<dx:GridViewDataTextColumn FieldName="EAN13" VisibleIndex="11">
				</dx:GridViewDataTextColumn>
			</Columns>
			<SettingsLoadingPanel Mode="Disabled" />
		</dx:ASPxGridView>
	</form>
</body>
</html>