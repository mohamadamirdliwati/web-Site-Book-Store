<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctlMenu.ascx.cs" Inherits="ctlMenu" %>
<style type="text/css"> 
    .Hidden{display:none}

    .MainMenu{background-color:#3A4F63;}
    .MainMenu > li
    {
        display:block; 
        padding:4px; 
        margin:4px; 
        float:left; 
        cursor:pointer;
        
        -webkit-border-radius: 5px;     
        -moz-border-radius: 5px;     
        -ms-border-radius: 5px;     
        -o-border-radius: 5px;     
        border-radius: 5px; 
        
    }
    .MainMenu li:hover, .MainMenu li:hover > a{
        background-color: #BFCBD6;
        color: #465C71;
        text-decoration: none;
    }
    /* hide first menu 'default.aspx' 
    .MenuHeader:first-child
    {
        display:none;
    }
    .MenuHeader:last-of-type
    {
        float:left;
    }
    .MenuHeader:last-of-type > .SubMenu
    {
        margin-right:-70px
    }
     */   
    .Menu{padding:0px;margin:0px }

    .Menu li{list-style-type:none;
        background-color: #465C71;
        border: 1px solid #4E667D;
        color: #DDE4EC;
        display: block;
        line-height: 1.35em;
        text-decoration: none;
        white-space: nowrap;             
        }
        
    .Menu li a{padding-right:4px;padding-left:4px}
    .Menu ul{padding:0px; margin:0px}

    .Menu a{color:#DDE4EC; text-decoration:none;
        display: block;
        white-space: nowrap;} 
    .SubMenu{position:absolute; background-color:DarkBlue; padding:0px; border:1px solid #4E667D; border-bottom:2px solid #333333;border-right:2px solid #333333}
    .SubMenu li{margin:0px;padding:4px; float:none; border:none; border-bottom:1px solid gray}
    .SubMenu li img{vertical-align:middle; border:none;}
</style>

<div class="Menu">
    <asp:Repeater runat="server" ID="rptMenu" DataSourceID="SiteMapDataSource1">
        <ItemTemplate>
            <div class="MainMenu">
                <asp:Repeater DataSource='<%# ((SiteMapNode) Container.DataItem).ChildNodes %>' runat="server">
                    <ItemTemplate>
                        <li class="MenuHeader">
                            <asp:HyperLink runat="server" NavigateUrl='<%#Eval("url") %>' Text='<%#Eval("Title") %>' />
                            <div class="SubMenu Hidden">
                                <ul>
                                    <asp:Repeater ID="bar" 
                                        DataSource='<%# ((SiteMapNode) Container.DataItem).ChildNodes %>' runat="server">
                                        <ItemTemplate>
                                            <li>
                                                <a href='<%#Eval("url") %>'>
                                                    <%#Eval("Title") %> 
                                                </a>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </li>
                    </ItemTemplate>
        <FooterTemplate>
            <% if (clsGlobal.IsAdmin)
               {%>
               <li>
                <asp:HyperLink runat="server" ID="lnkAdmin" NavigateUrl="~/Admin" Text="[ Control Panel ]" />
                </li>
            <%}
               else if (clsGlobal.IsCustomer)
               {%>
                <li>
                    <asp:HyperLink runat="server" ID="lnkBasket" NavigateUrl="~/Basket.aspx" 
                        Text='<%# "Basket" + (clsGlobal.Basket.Count==0?"": string.Format(" ({0})", clsGlobal.Basket.Count)) %>' />
                </li>
            <%}%>
        </FooterTemplate>
                </asp:Repeater>
                <div style="float:none;padding:10px;">&nbsp;</div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

</div>

<asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />

<script type="text/javascript">
    $(".MainMenu li").bind("click", function () {
        $(".SubMenu", this).toggleClass("Hidden");
    });
    $(".MainMenu li").bind("mouseleave", function () {
        $(".SubMenu", this).addClass("Hidden");
    });
    $(".SubMenu").bind("mouseleave", function () {
        $(this).addClass("Hidden");
    });

    //$("li").filter(".MainMenu").addClass("last-child");
</script>

