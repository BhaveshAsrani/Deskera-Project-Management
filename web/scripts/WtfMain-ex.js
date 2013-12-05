/*
 * Copyright (C) 2012  Krawler Information Systems Pvt Ltd
 * All rights reserved.
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/
//var communityTabs = [];
var userTabs = [];
var projectTabs = [];
//var courseTabs = [];
//var accountingTabs = [];
var mainPanel;
var deskeraAdmin = false;
var numTabs = 1;
var weekOff = [];
var pHoliday = [];
var reportActionValue = "";
var creator = false;
var globalDocId = "";
var globalPostid = "";
var refreshDash = [];
var companyName = "";
var pagebaseURL ="";
var activeTab = "";
var showHelpCompId = "";
var standAlone = false;
var titleText = "";
var _helpContent = [];
var _nexthelpContent = [];
var chatWinPosition = [];
var chatWinNumber = 0;
var chatWins = [];
var chatWinLimit = Math.floor(screen.width/225);
var currentTime = "";
var setChatFlag = new Array();     //this is used to trace wether msgenter event is registered or not
var fnInt;
Wtf.CurrencySymbol = "\u0024";
Wtf.ux.ContentPanel = function(config){
    Wtf.apply(this, config);
    Wtf.ux.ContentPanel.superclass.constructor.call(this, config);
};
Wtf.extend(Wtf.ux.ContentPanel, Wtf.Panel, {
    closable: true,
    autoScroll: (Wtf.isWebKit || Wtf.isIE) ? false : true
});
Wtf.ux.MainPanel = function(config){
    Wtf.ux.MainPanel.superclass.constructor.call(this, config);
};
Wtf.extend(Wtf.ux.MainPanel, Wtf.TabPanel, {
    loadTab: function(href, id, tabtitle, navAreaid, tabtype, queue, activesubtab,closable){
        var tabid = "tab" + id.substr(3);
        var tab = this.getComponent(tabid);
        if (tab) {
            this.setActiveTab(tab);
            if(activesubtab) {
                tab.activesubtab = activesubtab;
                if(tab.tabType == Wtf.etype.proj){
                    if(typeof activesubtab == "string")
                        Wtf.getCmp("projectTabs_"+tab.id.substr(3)).pro.fireEvent(activesubtab);
                    else
                        Wtf.getCmp("projectTabs_"+tab.id.substr(3)).pro.fireEvent(activesubtab.event);
                }
                if(tabid == "tabcompanyadminpanel"){
                    Wtf.getCmp("mainAdmin").fireEvent(activesubtab);
                }
            }
        }
        else {
            if(href == "../../project.html" || href == "../../documents.html"){
                if(Wtf.subscription.docs.subscription && !docScriptLoaded && Wtf.featuresView.docs){
                    WtfGlobal.loadScript("../../scripts/minified/document.js?v=219");
                    docScriptLoaded = true;
                }
            }
            if(href == "../../project.html"){
                if(Wtf.subscription.cal.subscription && !calLoad && Wtf.featuresView.cal)
                    WtfGlobal.loadScript("../../scripts/minified/calendar.js?v=219");
            }
            var autoload = {
                tabid: tabid,
                url: href,
                scripts: true
            };
            var p = new Wtf.ux.ContentPanel({
                id: tabid,
                title: tabtitle,
                autoLoad: autoload,
                navarea: navAreaid,
                layout: 'fit',
                tabType: tabtype,
                closable: closable != null ? closable : true,
                iconCls: getTabIconCls(tabtype)
            });

            if (queue) {
                switch (tabtype) {
                    case Wtf.etype.comm:
                        communityTabs.push(p);
                        break;
                    case Wtf.etype.proj:
                        projectTabs.push(p);
                        break;
                    case Wtf.etype.user:
                        userTabs.push(p);
                        break;
                    case Wtf.etype.lms:
                        courseTabs.push(p);
                        break;
                    case Wtf.etype.acc:
                        accountingTabs.push(p);
                        break;
                }
            }
            if(Wtf.get('fcue-360'))
                closeCue();
            this.add(p);
            this.setActiveTab(p);
            var msg = '';
            if(tabtype == 2 || tabtype == 4 || tabtype == 7 || tabtype == 9 || tabtype == 11 || tabtype == 13 || tabtype == Wtf.etype.contacts)
                msg = (typeof tabtitle == 'string') ? WtfGlobal.getLocaleText('pm.loading.text')+' '+tabtitle+'...' : WtfGlobal.getLocaleText('pm.loading.text')+'...';
            else
                msg = WtfGlobal.getLocaleText('pm.loading.text')+'...';
            showMainLoadMask(msg);
            if(activesubtab){
                p.activesubtab = activesubtab;
            }
            Wtf.getCmp(tabid).on("hide", function(tab) {
                var expandWin = Wtf.getCmp(tab.id.substr(3)+'Expand');
                if(expandWin != undefined)
                    expandWin.close();
                if(Wtf.get('fcue-360'))
                    closeCue();
            }, this);
        }
    }
});

function getTabIconCls(tabtype){
    switch (tabtype) {
        case Wtf.etype.home:
            return "pwnd dashboardTabIcon";
            break;
        case Wtf.etype.comm:
            return "dpwnd communityTabIcon";
            break;
        case Wtf.etype.proj:
            return "dpwnd projectTabIcon";
            break;
        case Wtf.etype.user:
            return "pwnd userTabIcon";
            break;
        case Wtf.etype.docs:
            return "pwnd doctabicon";
            break;
        case Wtf.etype.cal:
            return "dpwnd teamcal";
            break;
        case Wtf.etype.forum:
            return "dpwnd communitydiscuss";
            break;
        case Wtf.etype.pmessage:
            return "pwnd pmsgicon";
            break;
        case Wtf.etype.pplan:
            return "pwnd projplan";
            break;
        case Wtf.etype.adminpanel:
            return "pwnd admintab";
            break;
        case Wtf.etype.todo:
            return "pwnd todolistpane";
            break;
        case Wtf.etype.search:
            return "pwnd searchtabpane";
            break;
        case Wtf.etype.contacts:
            return "pwnd contactsTabIcon";
            break;
        case Wtf.etype.crm:
            return "crmTabIcon";
            break;
        case Wtf.etype.log:
            return "pwnd audittrailicon";
            break;
    }
}

Wtf.Action.prototype.setTooltip= function(qtipText) {
    this.callEach('setTooltip', [qtipText]);
}

Wtf.menu.BaseItem.override({
    onRender : function(container, position){
        this.el = Wtf.get(this.el);
        container.dom.appendChild(this.el.dom);
        if(this.tooltip){
            if(typeof this.tooltip == 'object'){
                Wtf.QuickTips.register(Wtf.apply({
                    target: this.el.id
                }, this.tooltip));
            } else {
                this.el.dom[this.tooltipType] = this.tooltip;
            }
        }
    },

    setTooltip: function(qtipText) {
        var itemEl = this.el;
        Wtf.QuickTips.register({
            target: itemEl.id,
            text: qtipText
        });
    }
});

Wtf.grid.RowNumberer.prototype.renderer=function(v, p, record, rowIndex){
    v = rowIndex+1;
    if(this.rowspan){
        p.cellAttr = 'rowspan="'+this.rowspan+'"';
    }
    p.attr = 'wtf:qtip="'+v+'"';
    return v;
}

Wtf.grid.RowNumberer.prototype.width = 33;

/*projects will have a each project's data in an associative array form
 *Each key will have an id, name, startdate, nonworkweekdays, project image
 *all permissions(overall, plan permission for each project), createdon, nickname,
 *description etc.
 */
var projects = [];
var projId = [];
var welcome = false;
var isPermalink = -1;
function collectProjectData(){
    var projCount = 0;
    var projNames;
    projId = [];
    projects = [];
    var projStartDate = [];
    var allPerm = [];
    var projImg = [];
    var cusCol =[]; // change for custom column (by kamlesh)
    var projQuickLink = false;
    var projNotificationSubscription = 0;
    var projDesc = "";
    var projNickname = "";
    var projCreatedon = "";
    var projPlanView ="";
    var projMilestoneStack ="";
    welcome = false;
    var pHoliday = [];
    Wtf.Ajax.requestEx({
        url: Wtf.req.widget + 'widget.jsp',
        params:{
            flag:-1
        }
    }, this, function(res){
        var obj = eval('('+res+')');
        projCount = obj.count;
        if(projCount != 0){
            var weekOff = [];
            for(var i=0; i<obj.data.length; i++){
                var currObj = obj.data[i];
                projNames = currObj.name;
                projId[i] = currObj.id;
                projStartDate = currObj.startdate;
                allPerm = eval('('+currObj.permission+')');
                projImg = currObj.img;
                projDesc = currObj.about;
                projNickname = currObj.nickname;
                projCreatedon = currObj.createdon;
                projQuickLink = currObj.quicklink;
                projPlanView = currObj.planview;
                projMilestoneStack = currObj.milestonestack;
                projNotificationSubscription = currObj.notifSubVal;
                cusCol = currObj.cusCol;
                var nonWorkWeekDays = eval('('+currObj.nonWorkWeekDays+')');
                if(nonWorkWeekDays.data !== undefined){
                    weekOff = new Array(nonWorkWeekDays.data.length);
                    for(var j = 0; j < nonWorkWeekDays.data.length; j++){
                        weekOff[j] = nonWorkWeekDays.data[j].day;
                    }
                }
                projects[i] = new Object();
                projects[i].id = projId[i];
                projects[i].name = projNames;
                projects[i].startDate = projStartDate;
                projects[i].createdon = projCreatedon;
                projects[i].nickname = projNickname;
                projects[i].isQuickLink = projQuickLink;
                projects[i].notifSubVal = projNotificationSubscription;
                projects[i].about = projDesc;
                projects[i].image = projImg;
                projects[i].permissions = allPerm;
                projects[i].nonWorkWeekDays = weekOff;
                projects[i].planview= projPlanView;
                projects[i].milestoneStack= projMilestoneStack;
                projects[i].customColumn = cusCol;
            }
        } else {
            welcome = true;
        }
        var cmpholiday = eval ('('+obj.companyHolidays+')');
        if(cmpholiday){
            if(cmpholiday.data !== undefined){
                for(j = 0; j < cmpholiday.data.length; j++) {
                    pHoliday[j] = Date.parseDate(cmpholiday.data[j].holiday, "Y-m-d").format(WtfGlobal.getOnlyDateFormat());
                }
            }
        }
        projects.totalCount = projCount;
        projects.companyHolidays = pHoliday;
        titleText =  document.title;
        startPermissionBot();
    }, function(res){
        });
}

function initLocaleInfo(){
    Wtf.getCmp("tabdashboard").setTitle(WtfGlobal.getLocaleText("pm.dashboard.text"));
}

Wtf.onReady(function(){
    validateServerSession();
    mainPanel = new Wtf.ux.MainPanel({
        id: 'as',
        region: 'center',
        deferredRender: false,
        resizeTabs: true,
        minTabWidth: 155,
        loadMask: new Wtf.LoadMask(document.body, Wtf.apply(this.loadMask)),
        cls: 'ascls',
        titleCollapse: true,
        activeTab: 0,
        enableTabScroll: true,
        items: [new Wtf.ux.ContentPanel({
            id: "tabdashboard",
            layout: "fit",
            title: WtfGlobal.chkFirstRun() ? WtfGlobal.getLocaleText('pm.welcometext') : WtfGlobal.getLocaleText('pm.dashboard.text'),
            navarea: "navareadashboard",
            closable:false,
            autoLoad: {
                url: "../../dashboard.html",
                scripts: true
            },
            iconCls: getTabIconCls(Wtf.etype.home),
            tabType: Wtf.etype.home
        })]
    });
    if(Wtf.isWebKit)
        WtfGlobal.loadStyleSheet("style/webkit.css");
    collectProjectData();
    Wtf.getCmp("tabdashboard").on("activate", function(dash){
        refreshDashboard(dash);
    }, this);
    var viewport = new Wtf.Viewport({
        layout: 'border',
        id:'viewport',
        items:[
             new Wtf.Panel({
                 region:'north',
                 autoHeight:true,
                 hidden:true,
                 border:false,
                 //autoScroll:true,
                 cls:'announcementpan',
                 id:'announcementpan',
                 html:'<div style="position: relative;"><span style="z-index: 10000; position: absolute; float: right; margin-top: 5px; margin-right: 5px; right: 0pt;"><img src="../../images/stop12.gif" alt="close" onclick="javascript:hideTopPanel();"></span><div id="announcementpandiv" style="padding:15px;"></div> </div>'
             }),
             new Wtf.Panel({
                 region:'center',
                 border:false,
                 layout:'border',
        items: [new Wtf.BoxComponent({
            region: 'north',
            el: "header"
        }), mainPanel]
             })]
    });

    createHelpStore();
    var searchpanel = new Wtf.KWLSearchBar({
        id: 'searchTopPanel',
        renderTo: "searchBar",
        autoWidth: true,
        layout: 'table',
        border: false,
        document: Wtf.subscription.docs ? Wtf.subscription.docs.subscription : Wtf.subscription.docs,
        documentView: Wtf.featuresView.docs,
        bodyStyle: 'float:right;'
    });
    viewport.doLayout();
    Wtf.useShims = true;
    Wtf.QuickTips.init();
    Wtf.get('textSearch').dom.style.width = '130px';
});

function refreshDashboard(dash){
    if(bHasChanged && refreshDash[0]){
        var icat = refreshDash.join("_").indexOf("all");
        if(icat != -1){
            refreshDash = [];
            refreshDash[0] = 'all';
        }
        for(var i=1; i < refreshDash.length+1; i++){
            var cat = refreshDash[i-1].substr(0, 3);
            switch(cat){
                case 'all':
                    collectProjectData();
                    dash.load({
                        url: "../../dashboard.html",
                        scripts: true
                    });
                    break;
                case 'prj':
                    var projid = refreshDash[i-1].split(".")[1];
                    var seq = projId.indexOf(projid);
                    var wid = Wtf.getCmp(projid+'_drag');
                    if(wid){
                        wid.changeImg(0, wid.tools.w_projectplan, 0);
                        toolHandler(projid, seq, 'w_projectplan');
                    }
                    break;
                case 'req':
                    Wtf.getCmp('requests_drag').callRequest();
                    break;
                case 'anc':
                    Wtf.getCmp('announcements_drag').callRequest();
                    break;
                case 'doc':
                    if(Wtf.getCmp('mydocs_drag'))
                        Wtf.getCmp('mydocs_drag').callRequest();
                    break;
                case 'pmg':
                    if(Wtf.getCmp('pm_drag'))
                        Wtf.getCmp('pm_drag').callRequest();
                    break;
                case 'qkl':
                    Wtf.getCmp('quicklinks_drag').callRequest();
                    break;
                case 'mtl':
                    var cmp = Wtf.get('ms_body_inner');
                    if(cmp) {
                        cmp.dom.innerHTML = "";
                        var proj = [], projNames = [];
                        for(var j = 0; j < projects.totalCount; j++){
                            if(projects[j].milestoneStack){
                                proj[proj.length] = projects[j].id;
                                projNames[projNames.length] = projects[j].name;
                            }
                        }
                        getMilestonesData(proj, projNames);
                    }
                    break;
                case 'pjh':
                    Wtf.getCmp('taskwiseprojecthealth_drag').callRequest();
                    break;
            }
        }
        refreshDash = [];
        bHasChanged=false;
    }
}

function checkPermalink(){
    var location_hash = window.location.hash;
    var nickname = location_hash.split("#nickname_");
    var ret = -1;
    if(nickname[1] && nickname[1] !== ''){
        var f = false;
        for(var cnt = 0; cnt < projects.totalCount; cnt++){
            if(projects[cnt].nickname == nickname[1]){
                f = true;
                break;
            }
        }
        if(!f){
            Wtf.Ajax.requestEx({
                url:Wtf.req.prj + 'getRelatedProjects.jsp',
                params:{
                    nickname: nickname[1]
                }
            }, this,
            function(res, req){
                var obj = eval('(' + res + ')');
                if(obj.data){
                    var pos = projects.length;
                    var details = eval('('+obj.data+')');
                    projects[pos] = new Object();
                    projects[pos].id = details.projectid;
                    projects[pos].name = details.projectname;
                    projects[pos].startDate = details.startdate;
                    projects[pos].createdon = details.createdon;
                    projects[pos].nickname = details.nickname;
                    projects[pos].about = details.description;
                    projects[pos].image = details.image;
                    projects[pos].permissions = eval('('+ obj.perm +')');
                    ret = pos;
                    loadPermalink(ret);
                } else {
            //error msg if project not found
            }
            },
            function(){
                msgBoxShow(4, 1);
                ret = -1;
            });
        } else {
            ret = cnt;
        }
    } else {
        ret = -1;
    }
    return ret;
}

function setUsername(uName){
    var _uElem = document.getElementById('whoami');
    _uElem.innerText = uName; //mofo IE
    _uElem.textContent = uName;
    if(Wtf.UPerm.User || Wtf.UPerm.Project || Wtf.UPerm.Company) {
        addToXCuts("shortcuts1", "#", WtfGlobal.getLocaleText('pm.administration.text'), "loadAdminPage();", WtfGlobal.getLocaleText('pm.Help.administration'), true);
    }
    var c = document.getElementById("userinfo");
    c.innerHTML += "&nbsp;<a id=\"dashProfile\" href=\"#\" onclick=\"showPersnProfile();\" wtf:qtip='"+WtfGlobal.getLocaleText('pm.Help.myprofile')+"'>"+WtfGlobal.getLocaleText('pm.myprofile.text')+"</a>";
    if(Wtf.subscription.pm.subscription && Wtf.featuresView.pm) {
        c.innerHTML += "&nbsp;&nbsp;&nbsp;<a id=\"dashPm\" href=\"#\" onclick=\"navigate('pm');\" wtf:qtip='"+WtfGlobal.getLocaleText('pm.Help.pm')+"'>"+WtfGlobal.getLocaleText('pm.personalmessages.text')+"</a>";
    }
    var cp = document.getElementById("changepass");
    if(cp)
        cp.setAttribute("wtf:qtip", WtfGlobal.getLocaleText('pm.Help.changepassword'));
}
function getCurrentUserData(){
    getCountryName();
    getTimeZone();
}
function sendInvitation(){
    this.inviteWindow= new Wtf.Window({
        title : WtfGlobal.getLocaleText('pm.common.inviteuser'),
        modal : true,
        iconCls : 'iconwin',
        width : 450,
        height: 395,
        resizable :false,
        buttonAlign : 'right',
        buttons :[{
            text: WtfGlobal.getLocaleText('lang.invite.text'),
            scope: this,
            handler: function(){
                if(this.inviteUser.form.isValid()){
                    this.inviteUser.form.submit({
                        scope: this,
                        success: function(){
                            msgBoxShow(79, 0);
                            this.inviteWindow.close();
                        },
                        failure: function(frm, action){
                            if(action.failureType == "client"){
                                msgBoxShow(80, 1);
                                return;
                            }
                            msgBoxShow(81, 1);
                            this.inviteWindow.close();
                        }
                    });
                }
            }
        },{
            text: WtfGlobal.getLocaleText('lang.cancel.text'),
            scope: this,
            handler: function(){
                this.inviteWindow.close();
            }
        }],
        layout : 'border',
        items :[{
            region : 'north',
            height : 75,
            border : false,
            bodyStyle : 'background:white;border-bottom:1px solid #bfbfbf;',
            html: getTopHtml(WtfGlobal.getLocaleText('pm.common.inviteuser'), "Invite a friend to join Deskera"+"<br><span style=\"float:right; \">"+WtfGlobal.getLocaleText('pm.common.requiredfields')+"</span>","../../images/createuser40_52.gif")
        },{
            region : 'center',
            border : false,
            bodyStyle : 'background:#f1f1f1;font-size:10px;',
            layout : 'fit',
            items :[this.inviteUser = new Wtf.form.FormPanel({
                url: '../../signup.jsp?mode=2&u='+ loginid,
                waitMsgTarget: true,
                method : 'POST',
                border : false,
                labelWidth: 100,
                bodyStyle : 'margin-top:20px;margin-left:20px;font-size:10px;',
                defaults: {
                    width: 398,
                    allowBlank: false
                },
                defaultType: 'textfield',
                items: [{
                    fieldLabel: 'First Name*',
                    validator:WtfGlobal.validateUserName,
                    allowBlank: false,
                    width: 200,
                    name : 'fn'
                },{
                    fieldLabel: 'Last Name*',
                    validator:WtfGlobal.validateUserName,
                    allowBlank: false,
                    width: 200,
                    name : 'ln'
                },{
                    fieldLabel: 'Email Address*',
                    width: 200,
                    name : 'e',
                    validator:WtfGlobal.validateEmail
                },{
                    xtype : 'fieldset',
                    title: WtfGlobal.getLocaleText('pm.personalmessage.note'),
                    autoHeight: true,
                    cls: 'inviteFieldSet',
                    items: [{
                        xtype :'textarea',
                        hideLabel: true,
                        height : 90,
                        width: 376,
                        name : 'msg',
                        id : 'invitationBody',
                        value : 'Hi,\n\tI have been using Deskera and thought you should check it out.\n\tDeskera is a Project Management Tool which aims at making life easy for us business users.'
                    }]
                }]
            })]
        }]
    });
    Wtf.getCmp("invitationBody").on("change", function(){
        Wtf.getCmp("invitationBody").setValue(WtfGlobal.HTMLStripper(Wtf.getCmp("invitationBody").getValue()));
    }, this);
    this.inviteWindow.show();
}

function loadAdminPage(id){
    var ev = "adminclicked";
    switch(id) {
        case "1":
            ev = "adminclicked";
            break;
        case 1:
            ev = "adminclicked";
            break;
        case "2":
            ev = "projectclicked";
            break;
        case 2:
            ev = "projectclicked";
            break;
        case "3":
            ev = "companyclicked";
            break;
        case 3:
            ev = "companyclicked";
            break;
    }
    mainPanel.loadTab("../../admin.html", "   companyadminpanel", WtfGlobal.getLocaleText('pm.administration.text'), "navareadashboard", Wtf.etype.adminpanel,false,ev);
}

function signOut(type){
    var _out = "";
    if(type !== undefined && typeof type != "object")
        _out = "?type="+type;
    _dC('username');
    _dC('lid');
    _dC('companyid');
    var m = Wtf.DomainPatt.exec(window.location);
    var _u = '../../error.jsp';
    if (type == "noaccess" || type == "alreadyloggedin") {
        _u += '?e=' + type;
        if(m && m[1]){
            _u += '&n=' + m[1];
        }
    }
    else {
        if (m && m[1]) {
            _u = '../../b/' + m[1] + '/jspfiles/signOut.jsp' + _out;
        }
    }
    _r(_u);
}

function _dC(n){
    document.cookie = n + "=" + ";path=/;expires=Thu, 01-Jan-1970 00:00:01 GMT";
}

function getPermissionObjects(permobj){
    var wrapobj = eval ('(' + permobj + ')');
//    if(wrapobj.Perm){
//        Wtf.Perm = wrapobj.Perm;
//    }
    if(wrapobj.UPerm){
        Wtf.UPerm = wrapobj.UPerm;
    }
    if(wrapobj.deskeraadmin){
        deskeraAdmin = true;
    }
}

function getSubscriptionObjects(permobj){
    var moduleObj = eval ('(' + permobj + ')');
    if(moduleObj) {
        Wtf.subscription = moduleObj;
    }
    Wtf.getCmp("searchTopPanel").setDocumentValue(Wtf.subscription.docs.subscription);
}

function getFeaturesView(featuresobj) {
    var featureObj = eval("(" + featuresobj + ")");
    if(featureObj.featureView) {
        Wtf.featuresView = featureObj.featureView;
    }
    Wtf.getCmp("searchTopPanel").setDocumentViewValue(Wtf.featuresView.docs);
}

function validateServerSession(){
    Wtf.Ajax.requestEx({
        url: 'jspfiles/validate.jsp',
        params: {
            blank: -1
        }
    }, this,
    function(result, req){
        var res = eval("(" + result + ")");
        getPermissionObjects(res.perm.trim());
        getSubscriptionObjects(res.modsub.trim());
        getFeaturesView(res.featureView.trim());

        if (res) {
//            WtfGlobal.loadScript("scripts/msgs/messages.js", initLocaleInfo);
            if(!window['messages']){
                window.location.reload(true);
            }
            if(res.subdomain == "demo"){
                addToXCuts("shortcuts2", "#", WtfGlobal.getLocaleText('pm.signup.text'), "newSignUp();", WtfGlobal.getLocaleText('pm.Help.signup'), true);
            }
            if(!deskeraAdmin){
                addToXCuts("shortcuts1", "#", WtfGlobal.getLocaleText('pm.contacts.text'), "navigate('con');", WtfGlobal.getLocaleText('pm.Help.contacts'), true);
                document.getElementById("signout").innerHTML = WtfGlobal.getLocaleText('pm.signout.text');
                document.getElementById("changepass").innerHTML = WtfGlobal.getLocaleText('pm.changepassword.text');
                Wtf.fly('loading-msg').update(WtfGlobal.getLocaleText("pm.renderingcomponents.text")+'...');
                fullname = res.fullname;
                setUsername(fullname);
                Wtf.pref = res.preferences[0];
                standAlone = res.standalone;
                setValidUserVariables(res.validuseroptions);
//                addToXCuts("shortcuts2", res.forum_base_url, WtfGlobal.getLocaleText('pm.forum.text'), '', WtfGlobal.getLocaleText('pm.Help.forum'), true);
//                addToXCuts("shortcuts2", "http://blog.deskera.com", WtfGlobal.getLocaleText('pm.blog.text'),'', WtfGlobal.getLocaleText('pm.Help.blog'), true);
                addToXCuts("shortcuts3", "#", "   "+WtfGlobal.getLocaleText('pm.quicktour.text'), "showHelp(1);", WtfGlobal.getLocaleText('pm.Help.quicktour'), true);
//                addToXCuts("shortcuts3", "http://support.deskera.com/index.php/Deskera_Project_Management_Help", WtfGlobal.getLocaleText('pm.help.text'), '', WtfGlobal.getLocaleText('pm.Help.help'), false);
                loginid = res.lid;
                Wtf.countryName = res.preferences[0].Countryid;
                Wtf.timezoneName = res.preferences[0].Timezone;
                Wtf.usrTzOffset = res.preferences[0].timezonediff;
                Wtf.systemTzOffset = res.preferences[0].systemtz;
                loginname = res.username;
                companyid = res.companyid;
                document.cookie = "featureaccess=" + eval('(' + res.perm.trim() + ')').UPerm.Features + ";path=/;";
                dojo.cometd.init("../../bind");
                var chatsubstr = "/" + loginid + "/chat";
                dojo.cometd.subscribe(chatsubstr, this, "globalchatPublishHandler");
                var txtSrch = Wtf.getCmp("textSearch");
                companyName = res.company;
                creator = res.superuser;
                Wtf.pagebaseURL = res.base_url;
                txtSrch.emptyText = WtfGlobal.getLocaleText("pm.searchon.text") + ": " + companyName;
                txtSrch.reset();
                //                getCurrentUserData();
                Wtf.cusColumnDS = new Wtf.CusColumnDS({
                    companyid : companyid,
                    mname:'getAllColumn'
                });
                if(!standAlone){
                    Wtf.Ajax.requestEx({
                        url: Wtf.req.widget+"widget.jsp",
                        params: {
                            flag: 106,
                            companyid: companyid
                        }
                    }, this,
                    function(response){
                        var obj = eval("(" + response + ")");
                        var swtch = obj;
                        if(obj.data){
                            obj = obj.data;
                            if(obj.length != 0){
                                for(var i = 0; i< obj.length; i++){
                                    if(obj[i].title !== 'Help')
                                        addToXCuts("shortcuts2", obj[i].url, obj[i].title, '', '', true);
                                    else
                                        addToXCuts("shortcuts3", obj[i].url, obj[i].title, '', '', false);
                                }
                            } else {
                                var values = eval ('(' + res.validuseroptions + ')');
                                var mailtoId = values.supprotlink;
                                addToXCuts("shortcuts2", res.forum_base_url, WtfGlobal.getLocaleText('pm.forum.text'), '', WtfGlobal.getLocaleText('pm.Help.forum'), true);
                                addToXCuts("shortcuts2", "http://blog.deskera.com", WtfGlobal.getLocaleText('pm.blog.text'),'', WtfGlobal.getLocaleText('pm.Help.blog'), true);
                                addToXCuts("shortcuts2","mailto:" + mailtoId, WtfGlobal.getLocaleText('pm.support.text'), '', WtfGlobal.getLocaleText('pm.Help.support'), true);
                                addToXCuts("shortcuts3", "http://support.deskera.com/index.php/Deskera_Project_Management_Help", WtfGlobal.getLocaleText('pm.help.text'), '', WtfGlobal.getLocaleText('pm.Help.help'), false);
                            }
                        } else {
                            values = eval ('(' + res.validuseroptions + ')');
                            mailtoId = values.supprotlink;
                            addToXCuts("shortcuts2", res.forum_base_url, WtfGlobal.getLocaleText('pm.forum.text'), '', WtfGlobal.getLocaleText('pm.Help.forum'), true);
                            addToXCuts("shortcuts2", "http://blog.deskera.com", WtfGlobal.getLocaleText('pm.blog.text'),'', WtfGlobal.getLocaleText('pm.Help.blog'), true);
                            addToXCuts("shortcuts2","mailto:" + mailtoId, WtfGlobal.getLocaleText('pm.support.text'), '', WtfGlobal.getLocaleText('pm.Help.support'), true);
                            addToXCuts("shortcuts3", "http://support.deskera.com/index.php/Deskera_Project_Management_Help", WtfGlobal.getLocaleText('pm.help.text'), '', WtfGlobal.getLocaleText('pm.Help.help'), false);
                        }
                        if(swtch.subscribedapplist!=undefined && swtch.subscribedapplist.length!=0){
                            subscribedAppsLinksURL(swtch.subscribedapplist);
                        }
                    },
                    function(request, response){
                    });
                } else {
                    var values = eval ('(' + res.validuseroptions + ')');
                    var mailtoId = values.supprotlink;
                    addToXCuts("shortcuts2", res.forum_base_url, WtfGlobal.getLocaleText('pm.forum.text'), '', WtfGlobal.getLocaleText('pm.Help.forum'), true);
                    addToXCuts("shortcuts2", "http://blog.deskera.com", WtfGlobal.getLocaleText('pm.blog.text'),'', WtfGlobal.getLocaleText('pm.Help.blog'), true);
                    addToXCuts("shortcuts2","mailto:" + mailtoId, WtfGlobal.getLocaleText('pm.support.text'), '', WtfGlobal.getLocaleText('pm.Help.support'), true);
                    addToXCuts("shortcuts3", "http://support.deskera.com/index.php/Deskera_Project_Management_Help", WtfGlobal.getLocaleText('pm.help.text'), '', WtfGlobal.getLocaleText('pm.Help.help'), false);
                }
            } else {
                WtfGlobal.loadScript("../../scripts/minified/superUser.js");
                WtfGlobal.loadStyleSheet("style/companystat.css");
            }
            if(!standAlone)
                createMaintainanceCall();
        } else
            signOut();
    }, signOut);
}

function newSignUp(){
    signOut("signout");
    window.location = 'http://www.deskera.com/project-management/pricing-and-signup';
}

function addToXCuts(id, u, t, eh, qt, sep){
    var textLink = '<div style="color:#083772;" wtf:qtip=\'' + qt + '\'>' + t + '</div>';
    var button = new Wtf.Toolbar.MenuButton({
        cls:'notification-menu',
        renderTo:id,
        text:textLink,
        tooltip : qt
    });    
    Wtf.DomHelper.append(id,'<table class="pipilinks"><tr><td>|</td></tr></table>');    
    button.on("click",function(){
        if(id == "Support") {
            document.getElementById('downloadframe').src = u;
        } else if(id == "signup") {
            newSignUp();
        } else if(t == WtfGlobal.getLocaleText('pm.administration.text')) {
            loadAdminPage();
        }else if(t == WtfGlobal.getLocaleText('pm.contacts.text')){
            navigate('con');
        }else if (t == WtfGlobal.getLocaleText('pm.audittrail.text')){
            showAuditTrail();
        }else if(t == WtfGlobal.getLocaleText('pm.signup.text')){
            newSignUp();
        }else if(t== WtfGlobal.getLocaleText('pm.quicktour.text')){
            showHelp(1);
        }else{
            window.open(u);
        }
    },this);
}

function setValidUserVariables(obj) {
    if(Wtf.UPerm.AuditTrail)
        addToXCuts("shortcuts1", "#", WtfGlobal.getLocaleText('pm.audittrail.text'), "showAuditTrail();", WtfGlobal.getLocaleText('pm.Help.audittrail'), true);
    var values = eval ('(' + obj + ')');
    Wtf.CurrencySymbol = values.currencysymbol;
//    var mailtoId = values.supprotlink;
//    addToXCuts("shortcuts2","mailto:" + mailtoId, WtfGlobal.getLocaleText('pm.support.text'), '', WtfGlobal.getLocaleText('pm.Help.support'), true);
    document.getElementById('companyLogo').alt = values.companyname;

    document.title = values.companyname+" "+WtfGlobal.getLocaleText("pm.browsertitle");
}

function setStatus(status,userid){ // this function used to change status of remote user on local window means online / offline
    var chatpanel = Wtf.getCmp('chatWin'+userid);
    if(chatpanel){
        chatpanel.setStatus(status);
    }
}

function getUserTime(){
    Stamp = new Date();
    var Hours;
    var Mins;
    var Time;
    Hours = Stamp.getHours();
    Mins = Stamp.getMinutes();
    if (Mins < 10) {
        Mins = "0" + Mins;
    }
    if(Hours<12){
        Time = Hours + ":" + Mins + " AM";
    }else if(Hours == 12){
        Time = Hours + ":" + Mins + " PM";
    }else {
        Hours -= 12;
        Time = Hours + ":" + Mins + " PM";
    }
    return Time;
}

function insertIntoChatwins(userid){
    var flag=true;
    for(var i=0;i< chatWins.length;i++){
        if(chatWins[i] == "chatWin"+userid){
            flag=false;
            break;
        }
    }
    if(flag==true){
        if(chatWinNumber>chatWinLimit-1){
            Wtf.getCmp(chatWins[chatWinLimit-1]).hide();
            chatWinNumber--;
        }
        chatWins[chatWinNumber] = "chatWin" + userid;
        chatWinNumber++;
    }
}

function deleteFromChatwins(userid){
    var i = 0;
    for(i;i< chatWins.length;i++){
        if(chatWins[i] == "chatWin"+userid){
            break;
        }
    }
    for(i;i< chatWins.length -1;i++)
        chatWins[i] = chatWins[i+1];
    chatWins[chatWins.length-1]=null;
    chatWinNumber--;
}

function globalchatPublishHandler(msg) {
    if(Wtf.getCmp('contactsview')!=null)
        Wtf.getCmp('contactsview').chatPublishHandler(msg);
    else{
        var temp = eval('(' + msg.data.data + ')');
        var temp1 = Wtf.decode(temp.data[0]).data;
        var time = getUserTime();
        if(temp1[0].timestamp)
            time = Date.parseDate(temp1[0].timestamp, "Y-m-d H:i:s").format('h:i A');
        if(temp1[0].mode != "msg") {
            if(temp1[0].mode == "offline"){
                if(Wtf.getCmp("chatWin" + temp1[1].userid)){
                    setStatus(0,temp1[1].userid);
                }
            }
            else if(temp1[0].mode == "online"){
                if(temp1[1].status == "request") {
                    Wtf.Ajax.requestEx({
                        url: Wtf.req.prt + "getFriendListDetails.jsp",
                        params: {
                            userid: loginid,
                            mode : '2',
                            remoteUser: temp1[1].userid
                        }
                    }, this);
                }
                if(Wtf.getCmp("chatWin" + temp1[1].userid)){
                    setStatus(1,temp1[1].userid);
                }
            }
        }else{
            var chatpanel = Wtf.getCmp('chatWin'+temp1[0].id);
            insertIntoChatwins(temp1[0].id);
            if (!chatpanel) {
                chatpanel = new Wtf.common.WtfGChatWindow({
                    renderTo : "chatFrame-zIndexed",
                    id: "chatWin" + temp1[0].id,
                    chatWith : temp1[0].sname,
                    status : 1,
                    userid : temp1[0].id
                });
            }
            chatpanel.show();
            var frame = Wtf.get('chatFrame-zIndexed');
            if(Wtf.isWebKit && frame){
                frame.show();
                frame.hide();
            }
            Wtf.get("chat_panel_header_tools_div" + temp1[0].id).addClass('newmsg');
            chatpanel.append(temp1[0].id,temp1[0].sname,temp1[0].message,time);
            if(setChatFlag[temp1[0].id]==undefined){            //change made to stop multiple message (kamlesh)
                chatpanel.on('msgentered',function(window,msg,towhom){
                    Wtf.Ajax.requestEx({
                        url: "jspfiles/chatmessage.jsp",
                        params: {
                            type : 0,                       //
                            mode : 'msg',                   //
                            user: fullname,                 //to show sender's name in Chat-window of Remote user
                            rUserId: temp1[0].id,           //to publish into channel with this id
                            rUserName:temp1[0].sname,       //TBR
                            rstatus: 'online',              //TBR
                            chatMessage: msg                //Chat-Message to be sent
                        }
                    },this,
                    function(result, req){});
                },this);
                setChatFlag[temp1[0].id] = true;
            }
            chatpanel.on('closeclicked',function(userid){
                Wtf.getCmp('chatWin'+userid).hide();
                deleteFromChatwins(userid);
            },this);
        }
    }
}

function showPersnProfile(){
    var p = Wtf.getCmp("pprofwin");
    if(!p){
        new Wtf.Profile().show();
    }
}

function changePassword() {
    var changePassWin = Wtf.getCmp("changePassword");
    if(!changePassWin) {
        new Wtf.ChangePassword().show();
        focusOn("opass");
    }
}

function invokeTagSearch(e){
    Wtf.getCmp("textSearch").setValue("tag:"+e.innerHTML);
    Wtf.getCmp("searchTopPanel").onButtonClick();
}

function displayChatList(){
    var chatListWin = Wtf.getCmp("chatListWindow");
    var leftoffset = document.getElementById('chatlistcontainer').offsetLeft;
    var topoffset = document.getElementById('chatlistcontainer').offsetTop+document.getElementById('chatlistcontainer').offsetHeight;
    if(chatListWin.innerpanel==null||chatListWin.hidden==true){
        chatListWin.setPosition(leftoffset,topoffset);
        chatListWin.show();
        chatListWin.showChatList();
    }else{
        chatListWin.hide();
    }
}

function showAuditTrail(){
    if(Wtf.UPerm.AuditTrail) {
        navigate('audit');
    }
}

function displayImportLog(){ //hide messege box then display import log.
    Wtf.MessageBox.hide();
    showImportLog();
}

function showImportLog(){ //display import log without closing messege box.
    var ilog = Wtf.getCmp('importlog');
    if(!ilog){
        ilog = new Wtf.ImportLog({
            title: WtfGlobal.getLocaleText('pm.dashboard.widget.quicklinks.importlog'),
            layout: 'fit',
            id: 'importlog',
            iconCls: 'dpwnd importLogIcon',
            closable: true
        });
        ilog.doLayout();
        Wtf.getCmp('as').add(ilog);
        Wtf.getCmp('as').setActiveTab(ilog);
    } else {
        Wtf.getCmp('as').setActiveTab(ilog);
    }
}

function createHelpStore() {
    helpRecord = Wtf.data.Record.create([
        {name: 'modulename'},
        {name: 'title'},
        {name: 'descp'},
        {name: 'compid'},
        {name: 'helpindex'}
    ]);
    var helpReader = new Wtf.data.KwlJsonReader({
        //  root : "data"
        }, helpRecord);

    helpStore = new Wtf.data.Store({
        reader : helpReader
    });
}
function showHelp() {

    var activeElement = Wtf.getCmp('as').getActiveTab().id;
    activeTab= activeElement.substr(3);
    var flag = 0;
    _helpContent = [];
    switch(activeTab){
        case 'dashboard':
            if(projId.length == 0)
                activeTab = 'welcomedashboard';
            break;
        case 'friends':
            showHelpCompId = Wtf.getCmp(activeElement).items.items[0].id;
            break;
        case 'pmessage':
            var activeSubTab = Wtf.getCmp('tabmailtab_pmpanel').getActiveTab().title;
            switch(activeSubTab){
                case WtfGlobal.getLocaleText('pm.common.messages'):
                    break;
                default:
                    flag = 1;
                    break;
            }
            break;
        case 'project':
            showHelpCompId = Wtf.getCmp(activeElement).items.items[0].id;
            //flag = 1;
            break;
        case 'companyadminpanel':
            activeSubTab = Wtf.getCmp(activeElement).findByType('tabpanel')[0].getActiveTab().title;
            switch (activeSubTab){
                case WtfGlobal.getLocaleText('pm.dashboard.widget.quicklinks.useradministration'):
                    showHelpCompId = Wtf.getCmp(activeElement).findByType('tabpanel')[0].getActiveTab().id;//append
                    activeTab = 'User Administration'.toString().toLowerCase().replace(/ /gi, "");
                    break;
                case WtfGlobal.getLocaleText('pm.dashboard.widget.quicklinks.projectadministration'):
                    showHelpCompId = Wtf.getCmp(activeElement).findByType('tabpanel')[0].getActiveTab().id;//append
                    activeTab = 'Project Administration'.toString().toLowerCase().replace(/ /gi, "");
                    break;
                case WtfGlobal.getLocaleText('pm.dashboard.widget.quicklinks.companyadministration'):
                    activeTab = 'Company Administration'.toString().toLowerCase().replace(/ /gi, "");
                    break;
            }

            break;
        case 'contactpanel':
            showHelpCompId = 'tabns_panel';//append direct
            break;
        case 'audittrail':
            showHelpCompId = 'auditTrailComp';//append with _
            break;
        case 'document':
            showHelpCompId = 'doc-mydocs';//combination of both
            activeTab = 'mydocuments';
            break;
        case 'archiveproject':
            showHelpCompId = Wtf.getCmp(activeElement).items.items[0].id;
            break;
        case 'ortlog' : //actually importlog. it is importlog not tabimportlog
            showHelpCompId = Wtf.getCmp(activeElement).items.items[0].id;
            activeTab = 'importlog';
            break;
        default:
            if(Wtf.getCmp(activeElement).findByType('tabpanel')[0] != null){
                activeSubTab = Wtf.getCmp(activeElement).findByType('tabpanel')[0].getActiveTab().title;
                switch (activeSubTab){
                    case WtfGlobal.getLocaleText('pm.project.Home.title'):
                        showHelpCompId = Wtf.getCmp(activeElement).findByType('tabpanel')[0].getActiveTab().id;//append
                        activeTab = 'home'
                        break;
                    case WtfGlobal.getLocaleText('pm.common.projectplan'):
                        var tabid = Wtf.getCmp(activeElement).findByType('tabpanel')[0].getActiveTab().id;
                        var projid = tabid.split('_')[0];
                        showHelpCompId = projid;
                        activeTab ='Project Plan'.toLowerCase().replace(/ /gi, "");
                        break;
                    case WtfGlobal.getLocaleText('pm.module.discussion'):
                        showHelpCompId = Wtf.getCmp(activeElement).findByType('tabpanel')[0].getActiveTab().id;//prepend
                        activeTab = 'discussion'.replace(/ /gi, "");
                        break;
                    case WtfGlobal.getLocaleText('pm.common.todolist.text'):
                        activeSubTab = activeSubTab.replace("-","");
                        tabid = Wtf.getCmp(activeElement).findByType('tabpanel')[0].getActiveTab().id;
                        projid = tabid.split('list_conainer')[1];
                        showHelpCompId = projid;
                        activeTab = 'ToDo List'.toLowerCase().replace(/ /gi, "");
                        break;
                    case WtfGlobal.getLocaleText('pm.module.teamcalendar'):
                        projid = Wtf.getCmp(activeElement).findByType('tabpanel')[0].getActiveTab().items.items[0].id;
                        showHelpCompId = projid;//prepend
                        activeTab = 'Team Calendar'.toLowerCase().replace(/ /gi, "");
                        break;
                    case WtfGlobal.getLocaleText('lang.documents.text'):
                        showHelpCompId = Wtf.getCmp(activeElement).findByType('tabpanel')[0].getActiveTab().items.items[0].id;//combi
                        activeTab = 'document'
                        break;
                    case WtfGlobal.getLocaleText('pm.module.projectsettings'):
                        projid = Wtf.getCmp(activeElement).findByType('tabpanel')[0].getActiveTab().id;
                        showHelpCompId = projid;//append to all
                        var admin = Wtf.getCmp(activeElement).findByType('tabpanel')[0].getActiveTab().MembergridPanel.title;
                        switch(admin){
                            case WtfGlobal.getLocaleText('pm.project.settings.members.helptext'):
                                activeTab = 'adminmember';
                                break;
                            case WtfGlobal.getLocaleText('pm.project.settings.invitation.helptext'):
                                activeTab = 'admininvite';
                                break;
                            case WtfGlobal.getLocaleText('pm.project.settings.request.helptext'):
                                activeTab = 'adminrequest';
                                break;
                            case WtfGlobal.getLocaleText('pm.calender.currentworkweek'):
                                activeTab = 'adminCalendar';
                                break;
                            default:
                                if(Wtf.getCmp('restogglebtn'+projid).pressed)
                                    activeTab = 'adminresource';
                                else
                                    activeTab = 'adminCalendar';
                                break;
                        }
                        break;
                    case WtfGlobal.getLocaleText('pm.project.resource.conflict'):
                        projid = Wtf.getCmp(activeElement).findByType('tabpanel')[0].getActiveTab().items.items[0].id;
                        activeTab = 'resource conflict'.replace(/ /gi, "");
                        break;
                    case WtfGlobal.getLocaleText('pm.personalmessages.reply'):
                        flag = 1;
                        activeTab= 'reply';
                        break;
                    case WtfGlobal.getLocaleText('pm.project.discussion.thread'):
                        flag = 1;
                        activeTab = 'new thread'.replace(/ /gi, "");
                        break;
                    default://Reports, Baseline Comparison
                        activeTab = 'report';
                        tabid = Wtf.getCmp(activeElement).findByType('tabpanel')[0].getActiveTab().id;
                        showHelpCompId = Wtf.getCmp(tabid).items.items[0].id;
                        break;
                }
            } else {
                var currentTab = Wtf.getCmp('as').getActiveTab();
                showHelpCompId = currentTab.items.items[0].id;
                var uname = document.getElementById('whoami').innerHTML;
                if(currentTab.title.trim() != uname){
                    activeTab = 'user';
                } else {
                    activeTab = 'loginuser';
                }
            }
            break;
    }
    if(flag == 0){
        if(helpStore.find("modulename", activeTab) == -1){
            Wtf.Ajax.requestEx({
                url: Wtf.req.base + "helpcontent.jsp",
                method: 'GET',
                params: {
                    module : activeTab
                }
            }, this,
            function(response, request){
                var obj = eval("(" + response + ")");
                var con = eval("(" + obj.helpcontent + ")");
                for(var i = 0; i < con.data.length; i++){
                    var newHelp = new helpRecord({
                        modulename : con.data[i].activetab,
                        title : WtfGlobal.getLocaleText(con.data[i].titletextkey),
                        descp : WtfGlobal.getLocaleText(con.data[i].descriptiontextkey),
                        compid : con.data[i].compid,
                        helpindex : con.data[i].helpindex
                    });
                    helpStore.add(newHelp);
                }
                helpStore.filter("modulename", activeTab);
                var rec  = helpStore.getAt(0);
                _helpContent[0] = '';
                _helpContent[1] = rec.data.title;
                _helpContent[2] = rec.data.descp;
                var we = new Wtf.taskDetail();
                we.welcomeHelp();
            },function(response, request){
                });
        } else {
            helpStore.filter("modulename", activeTab);
            var rec  = helpStore.getAt(0);
            _helpContent[0] = '';
            _helpContent[1] = rec.data.title;
            _helpContent[2] = rec.data.descp;
            var we = new Wtf.taskDetail();
            we.welcomeHelp();
        }
    }
}

function loadHelp(){
    var winHelp = new Wtf.Window({
        title:WtfGlobal.getLocaleText('pm.help.text'),
        id:'helpWindow',
        closable: true,
        modal: true,
        iconCls: "iconwin",
        width: 660,
        height:700,
        resizable: false,
        layout: 'border',
        buttonAlign: 'right',
        renderTo: document.body,
        buttons: [{
            text: WtfGlobal.getLocaleText('lang.close.text'),
            scope: this,
            handler: function(){
                winHelp.close();
            }
        }],
        items:[{
            region: 'north',
            height: 75,
            border: false,
            bodyStyle: 'background:white;border-bottom:1px solid #bfbfbf;',
            html: getTopHtml('Project Management','Here are some suggestions to get you going.','../../images/help.gif')
        },{
            region: 'center',
            border: false,
            bodyStyle: 'background:#f1f1f1;font-size:10px;',
            autoScroll:true,
            html:getHelpContent()
        }]
    });
    winHelp.show();
}

function createMaintainanceCall(){
    var time=300000;
    fnInt = setInterval(getSysMaintainanceData, time);
}

function abortMaintainanceCall() {
    clearInterval(fnInt);
}
function getSysMaintainanceData(){
    Wtf.Ajax.requestEx({
        url: Wtf.req.widget + 'widget.jsp',
        params:{
            flag:105
        }
    }, this,
    function(result, req){
        var obj = eval('('+result+')');
        if(obj.data!=undefined&&obj.success==true ){
            var announcementpan = Wtf.getCmp('announcementpan');
            announcementpan.setVisible(true);
            notificationMessage(obj.data[0].message);
            announcementpan.doLayout();
            Wtf.getCmp('viewport').doLayout();
        }
        else{
            hideTopPanel();
           // abortMaintainanceCall()//to be removed
        }
    });
}

function notificationMessage(msg) {
    var announcementpan = Wtf.getCmp('announcementpan');
    if(announcementpan !=null) {
        announcementpan.setVisible(true);
        document.getElementById("announcementpandiv").innerHTML =msg;
        announcementpan.doLayout();
        Wtf.getCmp('viewport').doLayout();
    }
}
function hideTopPanel() {
    var announcementpan = Wtf.getCmp('announcementpan');
    if(announcementpan !=null) {
        document.getElementById("announcementpandiv").innerHTML ="";
        announcementpan.setVisible(false);
        announcementpan.doLayout();
        Wtf.getCmp('viewport').doLayout();
        abortMaintainanceCall();
    }
}

Wtf.ux.Portal = Wtf.extend(Wtf.Panel, {
    layout: 'column',
    autoScroll: true,

    initComponent: function(){
        Wtf.ux.Portal.superclass.initComponent.call(this);
        this.addEvents({
            validatedrop: true,
            beforedragover: true,
            dragover: true,
            beforedrop: true,
            drop: true,
            ondrag: true
        });
    },

    initEvents: function(){
        Wtf.ux.Portal.superclass.initEvents.call(this);
        this.dd = new Wtf.ux.Portal.DropZone(this, this.dropConfig);
    }
});
Wtf.reg('portal', Wtf.ux.Portal);

Wtf.ux.Portal.DropZone = function(portal, cfg){
    this.portal = portal;
    Wtf.dd.ScrollManager.register(portal.body);
    Wtf.ux.Portal.DropZone.superclass.constructor.call(this, portal.bwrap.dom, cfg);
    portal.body.ddScrollConfig = this.ddScrollConfig;
};

Wtf.extend(Wtf.ux.Portal.DropZone, Wtf.dd.DropTarget, {
    ddScrollConfig: {
        vthresh: 50,
        hthresh: -1,
        animate: true,
        increment: 200
    },
    createEvent: function(dd, e, data, col, c, pos){
        return {
            portal: this.portal,
            panel: data.panel,
            columnIndex: col,
            column: c,
            position: pos,
            data: data,
            source: dd,
            rawEvent: e,
            status: this.dropAllowed
        };
    },

    notifyOver: function(dd, e, data){

        var xy = e.getXY(), portal = this.portal, px = dd.proxy;
        // case column widths
        if (!this.grid) {
            this.grid = this.getGrid();
        }

        // handle case scroll where scrollbars appear during drag
        var cw = portal.body.dom.clientWidth;
        if (!this.lastCW) {
            this.lastCW = cw;
        }
        else
        if (this.lastCW != cw) {
            this.lastCW = cw;
            portal.doLayout();
            this.grid = this.getGrid();
        }

        // determine column
        var col = 0, xs = this.grid.columnX, cmatch = false;
        for (var len = xs.length; col < len; col++) {
            if (xy[0] < (xs[col].x + xs[col].w)) {
                cmatch = true;
                break;
            }
        }
        // no match, fix last index
        if (!cmatch) {
            col--;
        }

        // find insert position
        var p, match = false, pos = 0, c = portal.items.itemAt(col)
        var items =new Array();
        if(c.items){
            items=c.items.items;
        }

        for (len = items.length; pos < len; pos++) {
            p = items[pos];
            var h = p.el.getHeight();
            if (h !== 0 && (p.el.getY() + (h / 2)) > xy[1]) {
                match = true;
                break;
            }
        }

        var count=0;
        if(c.items){
            count=c.items.getCount();
        }
        var overEvent = this.createEvent(dd, e, data, col, c, match && p ? pos : count);

        if (portal.fireEvent('validatedrop', overEvent) !== false &&
            portal.fireEvent('beforedragover', overEvent) !== false) {

            // make sure proxy width is fluid
            px.getProxy().setWidth('auto');

            if (p) {
                px.moveProxy(p.el.dom.parentNode, match ? p.el.dom : null);
            }
            else {
                px.moveProxy(c.body.dom, null);
            }

            this.lastPos = {
                c: c,
                col: col,
                p: match && p ? pos : false
            };
            this.scrollPos = portal.body.getScroll();

            portal.fireEvent('dragover', overEvent);

            return overEvent.status;

        }
        else {
            return overEvent.status;
        }

    },

    notifyOut: function(){
        delete this.grid;
    },

    notifyDrop: function(dd, e, data){
        delete this.grid;

        var c = this.lastPos.c, col = this.lastPos.col, pos = this.lastPos.p;

        var _count=0;
        if(c.items){
            _count=c.items.getCount();
        }
        var dropEvent = this.createEvent(dd, e, data, col, c, pos !== false ? pos : _count);

        if (this.portal.fireEvent('validatedrop', dropEvent) !== false &&
            this.portal.fireEvent('beforedrop', dropEvent) !== false) {

            dd.proxy.getProxy().remove();
            if (dd.panel.ownerCt == this.lastPos.c) {
                dd.panel.el.dom.parentNode.removeChild(dd.panel.el.dom);
            }
            if (this.lastPos.p !== false) {
                this.lastPos.c.insert(this.lastPos.p, dd.panel);
            }
            else {
                this.lastPos.c.add(dd.panel);
            }
            this.portal.doLayout();

            this.portal.fireEvent('drop', dropEvent);

            // scroll position is lost on drop, fix it
            var st = this.scrollPos.top;
            if (st) {
                var d = this.portal.body.dom;
                setTimeout(function(){
                    d.scrollTop = st;
                }, 10);
            }
        }
    },

    // internal cache of body and column coords
    getGrid: function(){
        var box = this.portal.bwrap.getBox();
        box.columnX = [];
        this.portal.items.each(function(c){
            box.columnX.push({
                x: c.el.getX(),
                w: c.el.getWidth()
            });
        });
        return box;
    }
});

function button1menu(subscribedapplist) {
    this.button1.menu.removeAll();   
    for(var i=0; i< subscribedapplist.length; i++){
        this.button1.menu.addText('<div class="wrapperForMenu"><div style="padding: 8px 0 5px 5px;" /> <a href="'+subscribedapplist[i].appurlformat+'" target="_blank" onclick="javascript:closeMenu();" id="'+subscribedapplist[i].appname+'" wtf:qtip="'+subscribedapplist[i].appname+'">'+subscribedapplist[i].appname+'</a></div>');
    }
    this.button1.showMenu();
}

function subscribedAppsLinksURL(subscribedapplist){
    var menu1 = new Wtf.menu.Menu({
        cls:'mainMenu1',
        items:['']
    });

    this.button1 = new Wtf.Toolbar.MenuButton({
        menu : menu1,
        cls:'notification-menu',
        height:50,
        renderTo:'shortcuts3',
        text:'<div class ="switchwrapper" style="float:left;"><div style="color:#083772;font-size:11px;float:left;">'+WtfGlobal.getLocaleText('pm.common.switchto')+' &#9662;</div></div>'
    });   
    Wtf.DomHelper.append('shortcuts3','<table class="pipilinks"><tr><td>|</td></tr></table>');
    this.button1.on("click",function(){
        button1menu(subscribedapplist);
    },this);
}
