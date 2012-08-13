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

getPermissionLevel : function(MainPanel,cid){
    var perm="";
    var t=MainPanel.calTree.agendaStore.find("cid",cid);
    if(t!=-1){
        perm=MainPanel.calTree.agendaStore.getAt(t).data["permissionlevel"];
    }
    return perm;
},

//HTMLScriptStripper : function(val){
//    return Wtf.util.Format.stripTags(val);
//},

getPermLevelByEid : function(MainPanel,eid){
    var cid="";
    var perm="";
    var t = -1;

    if(MainPanel.currentview != "agendaView") {
        // if not agendaView then fetch permission level using eStore
        t = MainPanel.eStore.find("peid", eid);
        if(t != -1)
            cid = MainPanel.eStore.getAt(t).data["cid"];
    }
    else {
        // else fetch permission level using agenda grid store
        var gridStore = Wtf.getCmp(MainPanel.id + '_agendaGrid').getStore();
        t = gridStore.find("eid", eid);
        if(t != -1)
            cid = gridStore.getAt(t).data["cid"];
    }

    t=MainPanel.calTree.agendaStore.find("cid",cid);
    if(t!=-1){
        perm=MainPanel.calTree.agendaStore.getAt(t).data["permissionlevel"];
    }
    return perm;
}/*,

removeRecords:function(st,field,value){
    var recs=st.query(field,value,true);
    recs.each(function(r){
        st.remove(r);
    });
}*/

}
}();
/*===================================utils.js================================ */



/*//FILE:================================combohandler.js======================*/
/*Wtf.form.ComboBox.country = [
	['af','Afganistan'],
	['In','India'],
	['jp','Japan'],
	['US','America']
];*/

/*Wtf.form.ComboBox.timezone = [
	['gm','(GMT+05:30)Indian Standard Time'],
	['kt','(GMT+05:45)Katmandu Standard Time']
];*/
Wtf.form.ComboBox.dupdata = [
	['b','Busy'],
	['t','Tentative'],
	['o','Out of Office']
];

Wtf.form.ComboBox.dupmark = [
	['h','High'],
	['m','Moderate'],
	['l','Low']
];

/*Wtf.form.ComboBox.dupReminder=[
	['e','E-mail'],
	['p','Pop up']
];

Wtf.form.ComboBox.dupReminTime=[
	['5','5 minutes'],
	['10','10 minutes'],
	['15','15 minutes'],
	['30','30 minutes'],
	['60','1 hour'],
	['120','2 hours'],
	['300','5 hours'],
	['720','12 hours'],
	['1440','1 day'],
	['2880','2 days'],
	['10080','1 week']
];*/

Wtf.form.ComboBox.duptime =[
	[0,'00:00','12:00 AM'],[1,'00:30','12:30 AM'],
        [2,'1:00','1:00 AM'],[3,'1:30','1:30 AM'],
	[4,'2:00','2:00 AM'],[5,'2:30','2:30 AM'],
	[6,'3:00','3:00 AM'],[7,'3:30','3:30 AM'],
	[8,'4:00','4:00 AM'],[9,'4:30','4:30 AM'],
	[10,'5:00','5:00 AM'],[11,'5:30','5:30 AM'],
	[12,'6:00','6:00 AM'],[13,'6:30','6:30 AM'],
	[14,'7:00','7:00 AM'],[15,'7:30','7:30 AM'],
	[16,'8:00','8:00 AM'],[17,'8:30','8:30 AM'],
	[18,'9:00','9:00 AM'],[19,'9:30','9:30 AM'],
	[20,'10:00','10:00 AM'],[21,'10:30','10:30 AM'],
	[22,'11:00','11:00 AM'],[23,'11:30','11:30 AM'],
	[24,'12:00','12:00 PM'],[25,'12:30','12:30 PM'],
	[26,'13:00','1:00 PM'],[27,'13:30','1:30 PM'],
	[28,'14:00','2:00 PM'],[29,'14:30','2:30 PM'],
	[30,'15:00','3:00 PM'],[31,'15:30','3:30 PM'],
	[32,'16:00','4:00 PM'],[33,'16:30','4:30 PM'],
	[34,'17:00','5:00 PM'],[35,'17:30','5:30 PM'],
	[36,'18:00','6:00 PM'],[37,'18:30','6:30 PM'],
	[38,'19:00','7:00 PM'],[39,'19:30','7:30 PM'],
	[40,'20:00','8:00 PM'],[41,'20:30','8:30 PM'],
	[42,'21:00','9:00 PM'],[43,'21:30','9:30 PM'],
	[44,'22:00','10:00 PM'],[45,'21:30','10:30 PM'],
	[46,'23:00','11:00 PM'],[47,'23:30','11:30 PM']
];

/*Wtf.grid.dummyData = [
	['',''],
	['8 AM',""],
	['9 AM',""],
	['10 AM',""],
	['11 AM',""],
	['Noon',""],
	['1 PM',""],
	['2 PM',""],
	['3 PM',""],
	['4 PM',""],
	['5 PM',""],
	['6 PM',""],
	['7 PM',""],
	['8 PM',""],
	['9 PM',""],
	['10 PM',""],
	['11 PM',""]
];*/

Wtf.form.ComboBox.resourcename=[
//	['1','Make changes and manage sharing'],
	['1','Make changes to events'],
	['2','See all the events details']
//	['4','See free/busy information(no details)']
];
/*//FILE:================================combohandler.js======================*/

/*//FILE:=======================event.js======================================*/
Wtf.cal.eventForms = function(MainPanel){
this.parent =  MainPanel;
//this.eventWin = new Wtf.cal.eventWindow(this.parent);
Wtf.cal.eventForms.superclass.constructor.call(this);
};
Wtf.extend(Wtf.cal.eventForms,Wtf.Component,{

/*
*   Pls Don't delete
*
/*AddRecurring:function(){
    if (Wtf.isGecko == true) {
            h = 150;
    }
    if (Wtf.isIE == true) {
            h = 130;
    }
    win1 = new Wtf.Window({
        id: this.parent.id + 'Recurring',
         title: WtfGlobal.getLocaleText('pm.common.recurring.text'),
        closable: true,
        width: 240,
        height: 350,
        resizable: false,
        modal: true,
        plain: true,
        layout: 'fit',
        items: [{
            xtype: 'form',
            frame: true,
            border: false,
            hideBorders: true,
            items: [{
                xtype: 'fieldset',
                title: WtfGlobal.getLocaleText('pm.common.recurring.pattern'),
                height: h,
                items: [{
                    items: [{
                            xtype:'radio',
                            hideLabel:'true',
                            checked:true,
                            id :this.parent.id + 'Daily',
                            boxLabel:WtfGlobal.getLocaleText('lang.daily.text'),
                            name:'group1',
                            value:WtfGlobal.getLocaleText('lang.daily.text')
                        },{
                            layout:'column',
                            items:[{
                                    columnWidth:0.40,
                                    items:[{
                                        xtype:'radio',
                                        id :this.parent.id + 'Weekly',
                                        hideLabel:'true',
                                        boxLabel:'Weekly , ',
                                        name:'group1',
                                        value:WtfGlobal.getLocaleText('pm.project.plan.weekly')
                                    }]
                                },{
                                    columnWidth:0.60,
                                    items:[{ xtype: 'textfield',
                                        //hideLabel:'true',
                                        id:this.parent.id +'weekTextBox',
                                        width: 25
                                        }],
                                     html:"<label class='labelAlign'> week(s)</label>"
                                }]
                        },{
                            xtype:'radio',
                            hideLabel:'true',
                            id :this.parent.id + 'Monthly',
                            boxLabel:WtfGlobal.getLocaleText('pm.calender.monthly'),
                            name:'group1',
                            value:WtfGlobal.getLocaleText('pm.calender.monthly')
                        },{
                            xtype:'radio',
                            hideLabel:'true',
                            id :this.parent.id + 'Yearly',
                            boxLabel:WtfGlobal.getLocaleText('lang.yearly.text'),
                            name:'group1',
                            value:WtfGlobal.getLocaleText('lang.yearly.text')
                        }]
                }]
            }, {
                xtype: 'fieldset',
                title: WtfGlobal.getLocaleText('pm.project.endofrecuurence'),
                height: 100,
                items:[{
                    items: [{
                            xtype:'radio',
                            hideLabel:'true',
                            checked:true,
                            id :this.parent.id + 'noEnd',
                            boxLabel:WtfGlobal.getLocaleText('pm.common.noend'),
                            name:'group2',
                            value:'noEnd'
                         }, {
                            layout: 'column',
                            items: [{
                                columnWidth: 0.4,

                                items: [{
                                    xtype:'radio',
                                    hideLabel:'true',
                                    id :this.parent.id + 'EndBy',
                                    boxLabel:WtfGlobal.getLocaleText('lang.endby.text'),
                                    name:'group2',
                                    value:'EndBy'
                                }]
                           },{
                                columnWidth: 0.6,

                                labelWidth: 50,
                                items: [new Wtf.form.DateField({
                                    editable:false,
                                    hideLabel:true,
                                    format: WtfGlobal.getDateFormat(),
                                    //format: 'm/d/Y',
                                    id: this.parent.id + 'edate2'
                                })]
                            }]
                        }
                    ]
                }]
            }]
        }],
        buttons: [{
            id: this.parent.id + 'OkButton',
            handler: this.RecurrsionOK,
            scope: this,
            text: WtfGlobal.getLocaleText('lang.OK.text')
        }, {
            id: this.parent.id + 'CancelButton',
            handler: this.RecurrsionCancel,
            scope: this,
            text: WtfGlobal.getLocaleText('lang.cancel.text')
        }]
    });
    win1.show();
    if(this.parent.rec[0]!=undefined && this.parent.rec[0]!=""){
        Wtf.getCmp(this.parent.id+this.parent.rec[0]).setValue(1);
            if(this.parent.rec[0]=='Weekly')
                Wtf.getCmp(this.parent.id+"weekTextBox").setValue(this.parent.rec[1]);
    }
    if(this.parent.rec[2]!=undefined && this.parent.rec[2]!=""){
        Wtf.getCmp(this.parent.id+this.parent.rec[2]).setValue(1);
            if(this.parent.rec[2]=='EndBy')
               Wtf.getCmp(this.parent.id+'edate2').setValue(this.parent.rec[3]);
    }
},*/

oncheck1:function(q, p){
    if (p)
        Wtf.getCmp(this.parent.id + 'timeRight').hide();
    else
        Wtf.getCmp(this.parent.id + 'timeRight').show();
},

oncheck2:function(q, p){
    if (p.checked) {
       // Wtf.getCmp(this.parent.id + "recurringButton").enable();
    }else{
       // Wtf.getCmp(this.parent.id + "recurringButton").disable();
        for(i=0;i<4;i++){
            this.parent.rec[i]="";
        }
    }
},

AddEditToolbar:function(){
    this.parent.add(new Wtf.Panel({
        border: false,
        layout:'fit',
        id: this.parent.id + 'Appointmentform'
    }));
 },

// deleteGuest:function(e) {
//
//    var Grid  = Wtf.getCmp(this.parent.id+'guestGrid');
//    var eventSelect = Grid.getSelectionModel();
//    var selectedRow = eventSelect.getSelections();
//    var ds = Grid.getStore();
//    Wtf.MessageBox.confirm('Confirm Delete', 'Are you sure you want to delete?',function(btn){
//        if(btn == 'yes'){
//            ds.remove(selectedRow[0]);
//        }
//    })
//},

clearAppointmentValues : function(){
    var parentId = this.parent.id;
    Wtf.getCmp(parentId + 'Subject').setValue("");
    Wtf.getCmp(parentId + 'Location').setValue("");
    Wtf.getCmp(parentId + 'stime1').setValue("");
    Wtf.getCmp(parentId + 'etime1').setValue("");
    Wtf.getCmp(parentId + 'sdate1').setValue("");
    Wtf.getCmp(parentId + 'edate1').setValue("");
    Wtf.getCmp(parentId + 'Description').setValue("");
    Wtf.getCmp(parentId + 'showas').setValue("b");
    Wtf.getCmp(parentId + 'comboPriority').setValue("m");
    Wtf.getCmp(parentId + 'Resources').setValue("");
//    var Grid =  Wtf.getCmp(parentId+'guestGrid');
//    Grid.getStore().removeAll();
    for(var i=0;i<5;i++){
        if(Wtf.getCmp(parentId+'MainRemindPanel'+i)!=undefined){
            Wtf.getCmp(parentId+"MainRemindPanel"+i).destroy();
        }
//    Wtf.getCmp(parentId + 'ReminderButton').enable() ;
    }
},

//Main func
AddingTabPanelEvent:function (){
    var tabPanel;
    var id = this.parent.id;
    this.parent.hideMaintoolbar();
    this.parent.showFormtoolbar();
    this.parent.formview ='Appointmentform';
    var appt=Wtf.getCmp(id+'Appointmentform');
    if(!appt){
        this.AddEditToolbar();
        appt=Wtf.getCmp(id+'Appointmentform');
        this.parent.showCalPanel(appt);
    }
    else{
        this.parent.showCalPanel(appt);
        this.clearAppointmentValues();
        return;
    }

//    this.guestRecord = Wtf.data.Record.create([{
//            name: 'username'
//        }, {
//            name: 'userid'
//        }, {
//            name: 'emailid'
//        }, {
//            name:'response'
//        }, {
//            name: 'delmail'
//        }]);
//    this.dsGuest= new Wtf.data.Store({
//        reader: new Wtf.data.ArrayReader({}, this.guestRecord)
//    });

//    var cmGuest=new Wtf.grid.ColumnModel([
//        {header:"Name",dataIndex:'username',mapping:'username'},
//        {header:"user Id" ,dataIndex:'userid',mapping:'userid',hidden:true},
//        {header:"Email Id" ,dataIndex:'emailid',mapping:'emailid'},
//        {header:"Response",dataIndex:'response',mapping:'response'},
//        {header: "Delete",width:40,renderer:this.delmail,dataIndex:'delmail'}
//    ]);



//    var smGuest = new Wtf.grid.RowSelectionModel();
//    var guestGrid = new Wtf.grid.GridPanel({
//        ds: this.dsGuest,
//        id:this.parent.id+'guestGrid',
//        cm: cmGuest,
//        sm: smGuest,
//        height:190,
//        width:'100%',
//        viewConfig: {
//            forceFit: true
//        }
//    });
    var panheight = 145;
    if (Wtf.isGecko) {
        panheight = 150;
    }
    if (Wtf.isIE) {
        panheight = 140;
    }

    Wtf.getCmp(id+'Appointmentform').add(tabpanel = new Wtf.TabPanel({
        id: id + 'tabPanel',
        border: false,
        deferredRender:true ,
        activeTab: 0,
        items: [{
            title: WtfGlobal.getLocaleText('pm.event.details.text'),
            id: id + 'Appointment',
            autoScroll: true,
            bodyStyle: "position:relative;",
            border: false,
            layout:'column',
            frame: true,
            items: [
                new Wtf.Panel({
//                    frame: true,
                    border: false,
                    columnWidth:0.99,
                    height:440,
                    layout:'fit',
                    items: [{
                        xtype: 'form',
//                        layout:'fit',
                        border: false,
                        id: id+'eventForm',
                        items: [{
                                html: "<span style=\"float:right;\">"+WtfGlobal.getLocaleText('pm.common.requiredfields')+"</span>"
                               },{
                                border: false,
                               html: "<span style=\"float:right;\">( * indicates required fields )</span>"
                               },{
                                border: false,
                                xtype: 'fieldset',
                                id: id + 'detailsDiv',
                                title: WtfGlobal.getLocaleText('lang.details.text'),
                                height: 85,
                                labelWidth: 65,
                                items: [{
                                            xtype: 'textfield',
                                            fieldLabel: WtfGlobal.getLocaleText('lang.subject.text')+'*',
                                            allowBlank: false,
                                            maxLength: 100,
                                            id: id + 'Subject',
                                            width: (Wtf.isIE6) ? '415px' : '97%'
                                        }, {
                                            border: false,
                                            layout: 'column',
                                            items: [{
                                                    columnWidth: 0.4998,
                                                    labelWidth: 65,
                                                    border: false,
                                                    layout: 'form',
                                                    items: [{
                                                            xtype : 'combo',
                                                            fieldLabel: WtfGlobal.getLocaleText('pm.common.showAs'),
                                                            id: id + 'showas',
                                                            store: this.parent.eventWin.storeShowas,
                                                            displayField: 'state1',
                                                            value: 'b',
                                                            editable: false,
                                                            typeAhead: true,
                                                            valueField:'abbr1',
                                                            mode: 'local',
                                                            triggerAction: 'all',
                                                            selectOnFocus: true,
                                                            anchor: '97%'
                                                        }]
                                                    }, {
                                                    columnWidth: 0.497,
                                                    labelWidth: 65,
                                                    border: false,
                                                    layout: 'form',
                                                    items: [{
                                                            xtype : 'combo',
                                                            fieldLabel: WtfGlobal.getLocaleText('lang.priority.text'),
                                                            value: 'm',
                                                            id: id + 'comboPriority',
                                                            store: this.parent.eventWin.store4,
                                                            editable: false,
                                                            valueField:'abbr',
                                                            displayField: 'state',
                                                            typeAhead: true,
                                                            mode: 'local',
                                                            triggerAction: 'all',
                                                            selectOnFocus: true,
                                                            anchor: '97%'
                                                        }]
                                                }]

                                            }
                                        ]
                        }, {
                            xtype: 'fieldset',
                            border: false,
                            title: WtfGlobal.getLocaleText('lang.time.text'),
                            height: panheight,
                            items: [{
                                layout: 'column',
                                border: false,
                                items: [{
                                        columnWidth:0.9,
                                        border: false,
                                        layout: 'form',
                                        items: [{
                                            xtype : 'checkbox',
                                            id: id + 'CheckAllDay1',
                                            boxLabel: WtfGlobal.getLocaleText('pm.project.calendar.newEvent.allDay'),
                                            hideLabel: true/*,
                                            disabled:true*/
                                        }]
                                    }, {
                                        columnWidth: 0.4999,
                                        border: false,
                                        labelWidth: 65,
                                        layout: 'form',
                                        items: [{
                                                xtype : 'datefield',
                                                fieldLabel: WtfGlobal.getLocaleText('pm.project.calendar.newevent.startdate'),
                                                format: WtfGlobal.getOnlyDateFormat(),
                                                //format: 'm/d/Y',
                                                readOnly: true,
                                                id: id + 'sdate1',
                                                anchor: '97%'
                                            },{
                                            xtype : 'datefield',
                                            format: WtfGlobal.getOnlyDateFormat(),
                                            //format: 'm/d/Y',
                                            readOnly: true,
                                            fieldLabel: WtfGlobal.getLocaleText('pm.common.enddate'),
                                            id: id + 'edate1',
                                            anchor: '97%'
                                        }]
                                    }, {
                                        columnWidth: 0.4999,
                                        labelWidth: 65,
                                        border: false,
                                        id: id + 'timeRight',
                                        layout: 'form',
                                        items: [{
                                            xtype :'combo',
                                            fieldLabel: WtfGlobal.getLocaleText('pm.project.calendar.newevent.starttime'),
                                            id: id + 'stime1',
                                            store: this.parent.eventWin.store3,
                                            editable: false,
                                            displayField: 'disp',
                                            typeAhead: true,
                                            valueField:'abbr1',
                                            mode: 'local',
                                            triggerAction: 'all',
                                            selectOnFocus: true,
                                            maxHeight:200,
                                            anchor: '96.99%'
                                        }, {
                                            xtype :'combo',
                                            fieldLabel: WtfGlobal.getLocaleText('pm.project.calendar.newevent.endtime'),
                                            id: id + 'etime1',
                                            store: this.parent.eventWin.store3,
                                            editable: false,
                                            displayField: 'disp',
                                            valueField:'abbr1',
                                            typeAhead: true,
                                            mode: 'local',
                                            triggerAction: 'all',
                                            selectOnFocus: true,
                                            maxHeight:200,
                                            anchor: '96.99%'
                                        }]
                                    }//, {
                                        //columnWidth: 0.9,
                                        //border: false,
                                        //layout:'column'
                                       /* items: [{
                                            layout:'form',
                                            width:20,
                                            items:
                                                new Wtf.form.Checkbox({
                                                id: this.parent.id + 'RecurringPattern',
                                                hideLabel: true
                                            })
                                        },{
                                            layout:'form',
                                            columnWidth:0.8,
                                            items:
                                                new Wtf.Button({
                                                baseCls:'buttonrec',
                                                text: WtfGlobal.getLocaleText('pm.common.recurring.pattern'),
                                                id: this.parent.id + 'recurringButton'
                                            })
                                        }]*/
                                    //}
                                ]
                            }]
                    }, {
                        xtype: 'fieldset',
                        border: false,
                        title: WtfGlobal.getLocaleText('pm.project.calendar.newevent.otherdetails'),
                        labelWidth: 65,
                        defaults : {width: (Wtf.isIE6) ? '415px' : '97%'},
                        defaultType: 'textfield',
                        height:panheight,
                        items: [{
                                xtype: 'textarea',
                                fieldLabel: WtfGlobal.getLocaleText('lang.description.text'),
								maxLength:1024,
                                id: id + 'Description'
                            }, {
                                fieldLabel: WtfGlobal.getLocaleText('lang.location.text'),
								maxLength:1024,
                                id: id + 'Location'
                            }, {
                                fieldLabel: WtfGlobal.getLocaleText('pm.project.plan.task.attributes.resources'),
								maxLength:1024,
                                id: id + 'Resources'
                            }]
                    }]
                }]
            })/*,{
            columnWidth:0.35,
            layout:'border',
            height:440,
            items:[/*
                new Wtf.Panel({
                     autoHeight:true,
                    title: WtfGlobal.getLocaleText('lang.guests.text'),
                    region:'north',
                    layout:'fit',
                    items: guestGrid,
                    tbar: [{
                        text: WtfGlobal.getLocaleText('lang.guests.add'),
                        id: this.parent.id + 'AddAction1',
                        iconCls: 'add',
                        handler: this.AddGuest,
                        scope:this
                    }]
                }),*//*new Wtf.Panel({
                    height: 195,
                    title: WtfGlobal.getLocaleText('pm.common.reminder'),
                    frame: true,
                    region:'center',
                    border: true,
                    items: [{
                        xtype: 'form',
                        border: true,
                        tbar: [{
                            text: WtfGlobal.getLocaleText('pm.project.todo.reminder'),
                            id: this.parent.id + 'ReminderButton',
                            iconCls: 'add',
                            scope:this,
                            handler: this.AddingReminder
                        }],
                        items: [
                            new Wtf.Panel({
                            border: false,
                            cls:'reminderDiv',
                            id: this.parent.id + 'RemainderPanel'
                            })
                        ]
                    }]
                })
            ]
        }*/]
        }/*, {
            title: WtfGlobal.getLocaleText('pm.common.sxhedule'),
            disable:true,
            id: this.parent.id + 'schedule',
            width: '100%',
            height: 500,
            html: '<div id=' + this.parent.id + 'schedulediv></div>'
        }*/]
    }));
    this.parent.doLayout();
    //Wtf.getCmp(this.parent.id + "recurringButton").disable();
    //Wtf.getCmp(this.parent.id + 'edate1').disable();
    Wtf.getCmp(id + "CheckAllDay1").addListener('check', this.oncheck1, this);
    Wtf.getCmp(id + 'Description').on("change", function(){
        Wtf.getCmp(id + 'Description').setValue(WtfGlobal.HTMLStripper(Wtf.getCmp(id + 'Description').getValue()));
    }, this);
    Wtf.getCmp(id + 'Location').on("change", function(){
        Wtf.getCmp(id + 'Location').setValue(WtfGlobal.HTMLStripper(Wtf.getCmp(id + 'Location').getValue()));
    }, this);
    Wtf.getCmp(id + 'Resources').on("change", function(){
        Wtf.getCmp(id + 'Resources').setValue(WtfGlobal.HTMLStripper(Wtf.getCmp(id + 'Resources').getValue()));
    }, this);
    Wtf.getCmp(id + 'Subject').on("change", function(){
        Wtf.getCmp(id + 'Subject').setValue(WtfGlobal.HTMLStripper(Wtf.getCmp(id + 'Subject').getValue()));
    }, this);
   // Wtf.get(this.parent.id + "RecurringPattern").addListener('click', this.oncheck2, this);
    //Wtf.getCmp(this.parent.id + "recurringButton").addListener('click',this.AddRecurring, this);
   //tabpanel.on('tabchange', this.TabChangeFun,this);
   Wtf.getCmp(id+'Subject').focus(false, 1000);
   Wtf.getCmp(id+'Subject').clearInvalid();
},
   TabChangeFun:function(tpanel, activepanel){
         if (activepanel.id == this.parent.id + 'schedule') {
             this.parent.doLayout();

        }
    },

//    SaveGuests:function (){
//            var results = this.grid.getSelections();
//            this.dsGuest.removeAll();
//            for (i = 0; i < results.length; i++) {
//                if(this.dsGuest.find("userid",results[i].get("userid"))==-1){
//                    var p = new this.guestRecord({
//                        username : results[i].get("username"),
//                        userid: results[i].get("userid"),
//                        emailid:results[i].get("emailid"),
//                        response:results[i].get("response")
//                    })
//                    this.dsGuest.add(p);
//                    Wtf.get("_delGuest").on("click",this.deleteGuest,this);
//                }
//            }
//
//            calContacts_Store.rejectChanges();
//            this.CloseWindow();
//        },

        CloseWindow:function(){
            this.win.close();
        },
       delmail:function(){
            return("<img src='../../images/Delete.gif'  id=_delGuest title='Delete Person' class='xbtn'></img>");
        },
/*    AddGuest:function(){

        var sm = new Wtf.grid.CheckboxSelectionModel();

        var cm = new Wtf.grid.ColumnModel([sm,{
            header: WtfGlobal.getLocaleText('pm.contact.name'),
            dataIndex: 'username'
        }, {
            header: WtfGlobal.getLocaleText('pm.common.userid'),
            dataIndex: 'userid',
            hidden:true
        }, {
            header: WtfGlobal.getLocaleText('lang.email-id.text'),
            dataIndex: 'emailid'
        },{
            header:WtfGlobal.getLocaleText('pm.common.response'),
            dataIndex:'response',
            hidden:true
        }]);
        cm.defaultSortable = true;

      this.grid = new Wtf.grid.GridPanel({
            ds: calContacts_Store,
            cm: cm,
            sm: sm,
            headerStyle: 'background-color: rgb(231,240,250) ',
            viewConfig: {
                forceFit: true
            }
        });

       this.win = new Wtf.Window({
            id: this.parent.id + '_Addguest',
            title: WtfGlobal.getLocaleText('lang.guest.add'),
            closable: true,
            width: 300,
            height: 400,
            modal: true,
            resizable: false,
            plain: true,
            renderTo:document.body,
            layout: 'fit',
            items: this.grid,
            buttons: [{
                text: WtfGlobal.getLocaleText('pm.common.save'),
                id: this.parent.id + 'Save'
            }, {
                text: WtfGlobal.getLocaleText('lang.cancel.text'),
                id: this.parent.id + 'cancelGuest'
            }]
        })
        this.win.show();

//        var Grid  = Wtf.getCmp(this.parent.id+'guestGrid');
//        var storeGuest = Grid.getStore();
//        for(i=0;i<storeGuest.getCount();i++){
//            var t=calContacts_Store.find("userid",storeGuest.getAt(i).get('userid'));
//            if(t!=-1){
//                sm.selectRow(t,true);
//                var rec = calContacts_Store.getAt(t);
//                var response = storeGuest.getAt(i).get('response');
//                rec.set('response',response);
//            }
//        }

//        Wtf.get(this.parent.id + 'Save').on('click',this.SaveGuests,this);
        Wtf.get(this.parent.id + 'cancelGuest').on('click',this.CloseWindow,this);
    },
    */
//    AddingReminder:function (h,k,time){
//        if(h!=1){
//            k='e';
//            time='5';
//        }
//        this.parent.Calendar_countReminder++;
//        var combobutton=0;
//        for(combobutton=0;combobutton<5;combobutton++){
//            if(Wtf.getCmp(this.parent.id+'MainRemindPanel'+combobutton)==undefined)
//                    break;
//        }
//        //var combobutton = i;
//        if (this.parent.Calendar_countReminder == 5) {
//            Wtf.getCmp(this.parent.id + 'ReminderButton').disable() ;
//        }
//
//        //var a = this.parent.id + 'RemoveRemindButton' + this.Calendar_countReminder;
//        var reminders = new Wtf.Panel({
//            border: false,
//            id: this.parent.id+'MainRemindPanel'+combobutton,
//            layout: 'column',
//            items: [{
//                columnWidth: 0.45,
//                layout: 'form',
//                items: [new Wtf.form.ComboBox({
//                    id: this.parent.id+'PopupCombo'+ combobutton ,
//                    hideLabel: true,
//                    store: this.parent.eventWin.storeReminder,
//                    editable: false,
//                    displayField: 'state1',
//                    valueField:'abbr1',
//                    typeAhead: true,
//                    mode: 'local',
//                    value: k,
//                    triggerAction: 'all',
//                    selectOnFocus: true,
//                    anchor: '95%'
//                })]
//            }, {
//                columnWidth: 0.45,
//                layout: 'form',
//                items: [new Wtf.form.ComboBox({
//                    hideLabel: true,
//                    id: this.parent.id+'ReminderEndTime'+ combobutton,
//                    store: this.parent.eventWin.storereminderTime,
//                    valueField:'abbr1',
//                    editable: false,
//                    displayField: 'state1',
//                    typeAhead: true,
//                    mode: 'local',
//                    value:time,
//                    triggerAction: 'all',
//                    selectOnFocus: true,
//                    anchor: '95%'
//                })]
//            }, {
//                columnWidth: 0.1,
//                layout: 'form',
//                items: [new Wtf.Panel({
//                    border: false,
//                    id: this.parent.id+'_RemoveReminderPanel_'+combobutton
//                })]
//            }]
//    });
//    Wtf.getCmp(this.parent.id + 'RemainderPanel').add(reminders);
//    Wtf.getCmp(this.parent.id + "RemainderPanel").doLayout();
//    var a = document.getElementById(this.parent.id+'_RemoveReminderPanel_'+combobutton);
//    a.innerHTML = "<span id=" + this.parent.id + "_button_"+combobutton+" class ='AddReminderClass'><img src = '../../images/Cancel.gif' height = '16px' width = '16px'/></span>";
//    Wtf.get(a).addListener('click', this.RemoveReminder);
//},
//
//RemoveReminder:function(e){
//    var main = this.id.split('_');
//    Wtf.getCmp(main[0]+"MainRemindPanel"+main[2]).destroy();
//    var comp = Wtf.getCmp(main[0]);
//    comp.Calendar_countReminder--;
//    if (comp.Calendar_countReminder < 5) {
//        Wtf.getCmp(main[0] + 'ReminderButton').enable();
////    }
//},

 AddingEventValues : function(a, eventClick){
    var parentId = this.parent.id;
    this.parent.EventClick = eventClick;
    this.parent.calPerm=Wtf.cal.utils.getPermissionLevel(this.parent,a[13]);
    if(!this.parent.archived) {
        if(this.parent.calPerm!=""&&this.parent.calPerm>1){
            Wtf.getCmp(parentId+'SaveAction1').disable();
            Wtf.getCmp(parentId+'deleteEventClick').disable();
        }
        else{
            Wtf.getCmp(parentId+'SaveAction1').enable();
            Wtf.getCmp(parentId+'deleteEventClick').enable();
        }
    }
    var data = a[6];
    data = data.replace(/!NL!/g," ");
    a[6] = data;
    this.enableDisableFormFields(a[15], parentId);
    Wtf.getCmp(parentId + 'sdate1').format = WtfGlobal.getOnlyDateFormat();
    Wtf.getCmp(parentId + 'edate1').format = WtfGlobal.getOnlyDateFormat();
    Wtf.getCmp(parentId + 'Subject').setValue(a[0]);
    Wtf.getCmp(parentId + 'Location').setValue(a[1]);
    Wtf.getCmp(parentId + 'stime1').setValue(a[2]);
    Wtf.getCmp(parentId + 'etime1').setValue(a[3]);
    Wtf.getCmp(parentId + 'sdate1').setValue(a[4]);
    Wtf.getCmp(parentId + 'edate1').setValue(a[5]);
    Wtf.getCmp(parentId + 'Description').setValue(a[6]);
    Wtf.getCmp(parentId + 'showas').setValue(a[7]);
    Wtf.getCmp(parentId + 'comboPriority').setValue(a[8]);
    if(a[9]=="" && a[10]==this.parent.defaultTS){
       // Wtf.getCmp(parentId + "recurringButton").disable();
       // Wtf.getCmp(parentId + "RecurringPattern").setValue(0);
    }
    else{
       // Wtf.getCmp(parentId + "recurringButton").enable();
       // Wtf.getCmp(parentId + "RecurringPattern").setValue(1);
        var checkpattern = a[9].substring(0,1);
        if(checkpattern=="D"){
            this.parent.rec[0]="Daily";
            this.parent.rec[1]="";
        }else if(checkpattern=="W"){
            this.parent.rec[0]="Weekly";
            this.parent.rec[1]=a[9].substring(1,3);
        }
        else if(checkpattern=="M"){
            this.parent.rec[0]="Monthly";
            this.parent.rec[1]="";
        }else if(checkpattern=="Y"){
            this.parent.rec[0]="Yearly";
            this.parent.rec[1]="";
        }
        if(a[10]==this.parent.defaultTS){
             this.parent.rec[2]="noEnd";
             this.parent.rec[3]="";
        }
        else{
            this.parent.rec[2]="EndBy";
            this.parent.rec[3]=a[12];
        }
    }

    Wtf.getCmp(parentId + 'Resources').setValue(a[11]);
    if(a[14] == true) {
        Wtf.getCmp(parentId + 'CheckAllDay1').setValue(true);
        Wtf.getCmp(parentId + 'timeRight').hide();
    }
    else {
        Wtf.getCmp(parentId + 'CheckAllDay1').setValue(false);
        Wtf.getCmp(parentId + 'timeRight').show();
    }
    Wtf.getCmp(parentId + 'Subject').focus(false, 100);
    Wtf.getCmp(parentId + 'Subject').clearInvalid();
   /* if(this.parent.EventClick!=""){
        var eid;
        if(this.parent.currentview !="agendaView"){
           eid= this.parent.EventClick.split("e_")[1];
        }else{
            eid=this.parent.EventClick;
        }
           Wtf.Ajax.requestEx({
            method: 'POST',
            url: Wtf.calReq.cal + 'calEvent.jsp',
            params: ({
                action: 4,
                eid:eid
            })},
            this,
            function(result, req){
                var nodeobj = eval("(" + result + ")");
//                var Grid =  Wtf.getCmp(this.parent.id+'guestGrid');
//                var guestStore = Grid.getStore();
                var guestRecord = Wtf.data.Record.create([{name: 'username'},{name: 'userid'},{name: 'emailid'},{name:'response'},{name: 'delmail'}]);
               // var contacts=Wtf.getCmp('contactsview');
                for(var i=0;i<nodeobj.data.length;i++){
                    var contactCheck = calContacts_Store.find("userid",nodeobj.data[i].userid);
                    if(contactCheck!=-1){
                        var statusfield;
                          if(nodeobj.data[i].status=='p'){
                            statusfield='Awaiting'
                            }else if(nodeobj.data[i].status=='r'){
                                statusfield='Rejected'
                                }else if(nodeobj.data[i].status=='a'){
                                    statusfield='Accepted'
                                }
//                        var p = new guestRecord({
//                            username : calContacts_Store.getAt(contactCheck).get("username"),
//                            userid: calContacts_Store.getAt(contactCheck).get("userid"),
//                            emailid:calContacts_Store.getAt(contactCheck).get("emailid"),
//                            response:statusfield
//                        })
//                        guestStore.add(p);
//                        Wtf.get("_delGuest").on("click",this.deleteGuest,this);
                    }
                }
                for(var i=0;i<nodeobj.Data1.data.length;i++){
                    var remtype = nodeobj.Data1.data[i].rtype;
                    var remtime = nodeobj.Data1.data[i].rtime;
//                    this.AddingReminder(1,remtype,remtime);
                }
            },
            function(result, req){
                  calMsgBoxShow(4, 1);
                   //Wtf.Msg.alert(WtfGlobal.getLocaleText('pm.msg.ERROR'), 'Error occurred while connecting to the server');
        });
//        Wtf.Ajax.request({
//            url: Wtf.calReq.cal + 'calEvent.jsp',
//            method: 'POST',
//            params: ({
//                action: 4,
//                eid:eid
//            }),
//            scope: this,
//            success: function(result, req){
//                var nodeobj = eval("(" + result.responseText.trim() + ")");
////                var Grid =  Wtf.getCmp(this.parent.id+'guestGrid');
////                var guestStore = Grid.getStore();
//                var guestRecord = Wtf.data.Record.create([{name: 'username'},{name: 'userid'},{name: 'emailid'},{name:'response'},{name: 'delmail'}]);
//               // var contacts=Wtf.getCmp('contactsview');
//                for(var i=0;i<nodeobj.data.length;i++){
//                    var contactCheck = calContacts_Store.find("userid",nodeobj.data[i].userid);
//                    if(contactCheck!=-1){
//                        var statusfield;
//                          if(nodeobj.data[i].status=='p'){
//                            statusfield='Awaiting'
//                            }else if(nodeobj.data[i].status=='r'){
//                                statusfield='Rejected'
//                                }else if(nodeobj.data[i].status=='a'){
//                                    statusfield='Accepted'
//                                }
////                        var p = new guestRecord({
////                            username : calContacts_Store.getAt(contactCheck).get("username"),
////                            userid: calContacts_Store.getAt(contactCheck).get("userid"),
////                            emailid:calContacts_Store.getAt(contactCheck).get("emailid"),
////                            response:statusfield
////                        })
////                        guestStore.add(p);
////                        Wtf.get("_delGuest").on("click",this.deleteGuest,this);
//                    }
//                }
//                for(var i=0;i<nodeobj.Data1.data.length;i++){
//                    var remtype = nodeobj.Data1.data[i].rtype;
//                    var remtime = nodeobj.Data1.data[i].rtime;
////                    this.AddingReminder(1,remtype,remtime);
//                }
//            },
//            failure: function(){
//                Wtf.Msg.alert(WtfGlobal.getLocaleText('pm.msg.ERROR'), 'Error occurred while connecting to the server');
//            }
//        });
    }*/
},

 enableDisableFormFields: function(a, parentId){
     if(a == '1'){
        if(!this.parent.archived){
            Wtf.getCmp(parentId+'deleteEventClick').hide();
            Wtf.getCmp(parentId+'SaveAction1').hide();
        }
        var itm = Wtf.getCmp(parentId+'eventForm').form.items.items;
        for(var i=0; i<itm.length; i++){
            itm[i].setDisabled(true);
        }
    } else {
        if(!this.parent.archived){
            Wtf.getCmp(parentId+'deleteEventClick').show();
            Wtf.getCmp(parentId+'SaveAction1').show();
        }
        itm = Wtf.getCmp(parentId+'eventForm').form.items.items;
        for(i=0; i<itm.length; i++){
            itm[i].setDisabled(false);
        }
    }
 },

 AddingValue : function(a){
    var parentId = this.parent.id;
    Wtf.getCmp(parentId+'Subject').setValue(a[0]);
    Wtf.getCmp(parentId+'sdate1').setValue(a[1]);
    Wtf.getCmp(parentId+'edate1').setValue(a[2]);
    Wtf.getCmp(parentId+'stime1').setValue(a[3]);
    Wtf.getCmp(parentId+'etime1').setValue(a[4]);
    Wtf.getCmp(parentId+'Location').setValue(a[5]);
    Wtf.getCmp(parentId+'comboPriority').setValue(a[7]);
    Wtf.getCmp(parentId+'showas').setValue(a[6]);
    Wtf.getCmp(parentId+'CheckAllDay1').setValue(a[8]);
    this.parent.EventClick = "";
//    if(a[8]!="none" && a[8]!=""){
//        this.AddingReminder(1,a[8],a[9]);
//    }
    Wtf.getCmp(parentId+'Subject').focus(false, 100);
    Wtf.getCmp(parentId+'Subject').clearInvalid();
    this.enableDisableFormFields(a[9], parentId);
 }/*,

 RecurrsionOK:function(){
    var a = Wtf.getCmp(this.parent.id+'Daily').getValue();
    var b= Wtf.getCmp(this.parent.id+'Weekly').getValue();
    var c = Wtf.getCmp(this.parent.id+'Monthly').getValue();
    var d = Wtf.getCmp(this.parent.id+'Yearly').getValue();
    var enda = Wtf.getCmp(this.parent.id+'noEnd').getValue();
    var endb = Wtf.getCmp(this.parent.id+'EndBy').getValue();
    if(endb==true){
        if(Wtf.getCmp(this.parent.id+'edate2').getValue()==""){
            calMsgBoxShow(113, 1);
            //Wtf.Msg.alert(WtfGlobal.getLocaleText('pm.msg.ERROR'), 'Please enter the valid end date for recurrence!');
            return;
        }
    }
    if (b==true){
        var weektext = Wtf.getCmp(this.parent.id+'weekTextBox').getValue();
        weektext = Wtf.cal.utils.HTMLScriptStripper(weektext)
        var checkNum = this.IsNum(weektext);
        if(checkNum==false){
            calMsgBoxShow(114, 1);
            //Wtf.Msg.alert(WtfGlobal.getLocaleText('pm.msg.ERROR'), 'Please enter the no. of week(s) for recurrence!');
            return;
        }
        this.parent.rec[0]=WtfGlobal.getLocaleText('pm.project.plan.weekly');
        this.parent.rec[1]=weektext;
    }
     else
        if(a==true){
            this.parent.rec[0]=WtfGlobal.getLocaleText('lang.daily.text');
            this.parent.rec[1]="";
         }
        else
            if(c==true){
                this.parent.rec[0]=WtfGlobal.getLocaleText('pm.calender.monthly');
                this.parent.rec[1]="";
            }
            else
                if(d==true){
                    this.parent.rec[0]=WtfGlobal.getLocaleText('lang.yearly.text');
                    this.parent.rec[1]="";
                }

    if(enda==true){
        this.parent.rec[2]="noEnd";
        this.parent.rec[3]="";
    }
    else
        if(endb==true){
            this.parent.rec[2]="EndBy";
            this.parent.rec[3]=Wtf.getCmp(this.parent.id+'edate2').getValue();
         }
    Wtf.getCmp(this.parent.id + 'Recurring').close();
},

 IsNum:function(sText){
    var IsNumber;
    if(sText==""){
    IsNumber=false;
    }else{
        IsNumber=(!isNaN(sText));
    }
    return IsNumber;
},

RecurrsionCancel:function(){
    Wtf.getCmp(this.parent.id + 'Recurring').close();
}*/
});

/*=============================event.js ===================================== */




/*//FILE:========================renderevent.js start ======================= */
Wtf.calStore = function(){
    var record = Wtf.data.Record.create(['eid','cid', 'startts', 'endts','subject','descr','location','showas','priority','recpattern','recend','resources','timestamp', 'allday', 'flagEvent', 'peid', 'deleteFlag']);
    Wtf.calStore.superclass.constructor.call(this, {
        remoteSort: true,
        proxy: new Wtf.data.HttpProxy({
            url: Wtf.calReq.cal + 'calEvent.jsp'
        }),
        reader: new Wtf.data.KwlJsonReader({
            root: 'data',
            id: 'jsonReader'
        },record)
    });
};

Wtf.extend(Wtf.calStore, Wtf.data.Store,{
    /*findRec:function(prop, val, operator){
        var record=[];
        var conFlag=false;
        var j=0;
        if(this.getCount()){
            for(var c=0;c<val[0].length;c++){
                var value=[val[0][c]];

                for(var a=1;a<val.length;a++)
                    value[a]=val[a];

                this.each(function(r){
                    for(var i=0;i<value.length;i++){
                        if(operator[i]==0){
                            if(r.data[prop[i]]==value[i])
                                conFlag=true;
                            else{
                                conFlag=false;
                                break;
                            }
                        }
                        else if(operator[i]==1){
                            if(r.data[prop[i]]>value[i])
                                conFlag=true;
                            else{
                                conFlag=false;
                                break;
                            }
                        }
                        else if(operator[i]==2){
                            if(r.data[prop[i]]<value[i])
                                conFlag=true;
                            else{
                                conFlag=false;
                                break;
                            }
                        }
                        else if(operator[i]==3){
                            if(r.data[prop[i]]>=value[i])
                                conFlag=true;
                            else{
                                conFlag=false;
                                break;
                            }
                        }
                        else if(operator[i]==4){
                            if(r.data[prop[i]]<=value[i])
                                conFlag=true;
                            else{
                                conFlag=false;
                                break;
                            }
                        }
                    }
                    if(conFlag){
                        record[j++] = r;
                    }
                });
            }
        }
        return record;
    },*/

    findRec:function(prop, val, operator){
        var records=[];
        var j=0;
        if(this.getCount()){
            var value;
            for(var c=0;c<val[0].length;c++){
                value=[val[0][c]];

                for(var a=1;a<val.length;a++)
                    value[a]=val[a];

                this.queryBy(function(record){
                    var startYMD = Wtf.cal.utils.sqlToJsDate(record.data.startts).format("Y-m-d H:i:s");
                    var endYMD = Wtf.cal.utils.sqlToJsDate(record.data.endts).format("Y-m-d H:i:s");
                    for(var i=0;i<value.length;i++){
                        var cmpVal = record.data[prop[i]];
                        if(operator[i]==0){
                            if(!(cmpVal==value[i])){
                                return false;
                            }
                        }
                        else if(operator[i]==1){
                            if(!(cmpVal>value[i])){
                                return false;
                            }
                        }
                        else if(operator[i]==2){
                            if(!(cmpVal<value[i])){
                                return false;
                            }
                        }
                        else if(operator[i]==3){
                            if(!((Wtf.cal.utils.sqlToJsDate(cmpVal).format("Y-m-d H:i:s")>=value[i]) || (startYMD<=value[i] && endYMD>value[i]) || (endYMD == value[i] && record.data.allday))) {
                                return false;
                            }
                        }
                        else if(operator[i]==4){
                            if(!((Wtf.cal.utils.sqlToJsDate(cmpVal).format("Y-m-d H:i:s")<=value[i]) || (startYMD<value[i] && endYMD>=value[i]))) {
                                return false;
                            }
                        }
                    }
                    records[j++]=record;
                    return true;
                },this);
            }
        }
        return records;
//        return ((records)?records:[]);
    },

    checkAndAdd:function(tempStore,field){
        tempStore.each(function(r){
            var t = this.find(field,r.data[field],0,false,true);
            if(t!=-1)
                this.remove(this.getAt(t));
            this.add(r);
        },this);
    },

    updateStore:function(field,rec,index){
        var t=this.find(field,rec.data[field],0,false,true);
        if(t!=-1){
            this.remove(this.getAt(t));
            this.add(rec);
        }
        else if(t==-1) {
            this.add(rec);
        }
    }
});
/*//FILE:============================renderevent.js end ========================== */



/*//FILE:============================weekwinshow.js start ========================== */
Wtf.cal.eventWindow=function(MainPanel){
    this.activeCells;
    this.timeString;
    this.heighttoevent;
    this.widthtoevent;
    this.parent=MainPanel;
    // json store

    /*this.DupData = Wtf.data.Record.create([{
        name: 'cname',
        mapping: 'cname'
    }]);*/

    /*this.reader = new Wtf.data.ArrayReader({}, [{
        name: 'year'
    }, {
        name: 'day',
        type: 'float'
    }]);

    this.store = new Wtf.data.SimpleStore({
        fields: ['abbr', 'state'],
        data: Wtf.form.ComboBox.dupdata
    });*/

    this.store4 = new Wtf.data.SimpleStore({
        fields: ['abbr', 'state'],
        data: Wtf.form.ComboBox.dupmark
    });

    this.store3 = new Wtf.data.SimpleStore({
        fields: ['abbr1', 'state1','disp'],
        data: Wtf.form.ComboBox.duptime
    });
    /*this.storeReminder = new Wtf.data.SimpleStore({
        fields: ['abbr1', 'state1'],
        data: Wtf.form.ComboBox.dupReminder
    });
    this.storereminderTime = new Wtf.data.SimpleStore({
        fields: ['abbr1', 'state1'],
        data: Wtf.form.ComboBox.dupReminTime
    });*/
    this.storeShowas = new Wtf.data.SimpleStore({
        fields: ['abbr1', 'state1'],
        data: Wtf.form.ComboBox.dupdata
    });

    this.id = "window_"+this.parent.id;
    Wtf.cal.eventWindow.superclass.constructor.call(this);
};

Wtf.extend(Wtf.cal.eventWindow,Wtf.Component,{
    CancelfuncWeek:function() {
    //    counter--;
        Wtf.getCmp(this.parent.id + 'OtherWinShow').hide();
    },
    OkfuncWeek:function() {
        var parentid = this.parent.id;
        if(!(Wtf.getCmp(parentid + 'locationweek').isValid()))
            return;

        var subject = WtfGlobal.HTMLStripper(Wtf.get(parentid + 'subjectweek').getValue());
        var stdt = (Wtf.getCmp(parentid + 'sdateweek').getValue()).format("Y-m-d");
        var enddt = (Wtf.getCmp(parentid + 'edateweek').getValue()).format("Y-m-d");
    //    var endt= (Wtf.getCmp(parentid + 'edateweek').getValue()).format("Y-m-d");
        //var endt= new Date(Wtf.get(parentid + 'edateweek').getValue()).format("Y-m-d");
        var showas = Wtf.getCmp(parentid + 'Showasweek').getValue();
        var priority = Wtf.getCmp(parentid + 'priorityweek').getValue();
        var allDay = Wtf.getCmp(this.parent.id + 'CheckAllDayweek').getValue();
    //    var reminder = Wtf.getCmp(parentid + 'Reminderweek').getValue();
    //    var remindertime = Wtf.getCmp(parentid + 'ReminderTimeweek').getValue();
    //    if(reminder!="" && reminder!='none'){
    //        reminder +='_'+remindertime;
    //        }else{
    //    	reminder = "";
    //    }

        /*if (endt< stdt) {
            Wtf.cal.utils.ShowErrorMsgBox("Please enter a valid start date");
            calMsgBoxShow(['Invalid Input', "Please enter a valid start date"], 1);
            return false;
        }*/
        if (subject == "") {
    //        Wtf.cal.utils.ShowErrorMsgBox("Please enter the required fields");
            calMsgBoxShow([WtfGlobal.getLocaleText('pm.common.invalidinput'), WtfGlobal.getLocaleText('pm.msg.80')], 1);
            Wtf.getCmp(parentid + 'subjectweek').setValue("");
            return false;
        }

       // hash.put(stdt, subject);
        //var index= this.CalendarStore.find('state1', Wtf.get(parentid + 'calendarweek').getValue());
        //var cid = this.CalendarStore.collect('id');
        //cid = cid[index];
        var cid = Wtf.getCmp(parentid + 'calendarweek').getValue();
        //var sttm= Wtf.cal.utils.getTimeIndNo(Wtf.get(parentid + 'stimeweek').getValue(), false);
        //var endtm= Wtf.cal.utils.getTimeIndNo(Wtf.get(parentid + 'etimeweek').getValue(), true);
        var sttm = Wtf.getCmp(parentid + 'stimeweek').getValue();
        var endtm = Wtf.getCmp(parentid + 'etimeweek').getValue();

        var sttm1 = parseInt(sttm);
        var endtm1 = parseInt(endtm);

        if(sttm1 >= endtm1 || enddt < stdt) {
            if(enddt <= stdt) {
                if(allDay)
                    calMsgBoxShow([WtfGlobal.getLocaleText('pm.common.invalidinput'), WtfGlobal.getLocaleText('pm.msg.validdate')], 1);
                else
                    calMsgBoxShow([WtfGlobal.getLocaleText('pm.common.invalidinput'), WtfGlobal.getLocaleText('pm.msg.validtime')], 1);
                return;
            }
        }

        if(allDay)
            enddt = Date.parseDate(enddt, "Y-m-d").add(Date.DAY, 1).format("Y-m-d");    // then add 1 day to end date

        Wtf.getCmp(parentid + 'OtherWinShow').hide();

        if(!allDay) {
            if(sttm.length==1)
                sttm="0"+sttm;
            sttm=(Wtf.form.ComboBox.duptime[sttm1])[1];
            if(endtm.length==1)
                endtm="0"+endtm;
            endtm=(Wtf.form.ComboBox.duptime[endtm1])[1];
        }
        else {
            sttm="00:00";
            endtm="00:00";
        }

        var loc=WtfGlobal.HTMLStripper(Wtf.get(parentid + 'locationweek').getValue());
    //    loc = Wtf.cal.utils.HTMLScriptStripper(loc);
    //    loc = WtfGlobal.HTMLStripper(loc);
        if(!loc||loc=="undefined")
            loc="";
        var eRecord = ["0", cid, stdt + " " + sttm + ":00.00", enddt + " " + endtm + ":00.00", subject, "", loc, showas, priority, "", this.parent.defaultTS, "", "",allDay/*, reminder*/];
        this.parent.insertEvent(eRecord);

        var node = this.parent.calTree.getNodeById(cid);
        if(node && !node.ui.isChecked()){
            node.ui.toggleCheck();
        }
    },

    closeEvent:function(e){
        var blockid = this.id;
        Wtf.MessageBox.confirm(WtfGlobal.getLocaleText('lang.confirm.text'), WtfGlobal.getLocaleText('pm.msg.341'), function(btn){
            if (btn == 'yes') {
               // var blockid = new String(e.id);
                blockid = blockid.split("close_");
                var eid=Wtf.getCmp(blockid[0] + 'e_' + blockid[1]);
                var MainPanel=Wtf.getCmp(blockid[0]);

                var calId=null;
                var t = MainPanel.eStore.find("peid", blockid[1]);
                if(t!=-1)
                    calId=MainPanel.eStore.getAt(t).data["cid"];

                var eRecord=[blockid[1],calId];
                eid.destroy();
                MainPanel.deleteEvent(eRecord,"0");
            }
        });
    },

    eventHtmlStr: function(eid, evttime, textStr, qTipStr, deleteflag){
        var str = "";
        var idd = this.parent.id;
        str += "<div id=" + idd + "wrapper_" + eid + " style='width: 100%; height: 15px;'>";
        str += "<span class=titleDiv id=" + idd + "title_" + eid + " style='font-size:smaller; overflow: hidden; height:15px; float: left; margin-left:1px;' wtf:qtip='"+qTipStr+"' wtf:qtitle='"+textStr+"'>" + evttime + "</span>";
        if(deleteflag == '0'){
            str += "<div class=closeDiv id=" + idd + "close_" + eid + " style='float: right; height:15px; display: none;' ><img id=" + idd + "calImg_" + eid + " style='height:11px;' src='../../images/deleteLink.gif' alt='Delete' wtf:qtip="+WtfGlobal.getLocaleText('pm.calaneder.deleteevent.qtip')+"/></div></div>";
        }
        str += "<div class=textDiv id=" + idd + "text_" + eid + " style='clear: both; height:100%; padding:1 1 1 1;' wtf:qtip='"+qTipStr+"' wtf:qtitle='"+textStr+"'>" + textStr + "</div>";
        return (str);
    },

    /*_eventHtmlStr : function(eid){
        var str = "";
        var idd = this.parent.id;
        var t=this.parent.eStore.find("eid",eid);
        var evtStatus=null;
        if(t!=-1){
            evtStatus=this.parent.eStore.getAt(t).data["showas"];
        }

        var textStr="";
        t=storeShowas.find('abbr1',evtStatus);
        if(t!=-1){
            textStr=storeShowas.getAt(t). data["state1"];
        }
        str += "<div id=" + this.id + "wrapper_" + eid + " style='width: 100%; height: 15px;'>";
        str += "<span class=titleDiv id=" + this.parent.id + "title_" + eid + " style='height:15px; float: left; margin-left:1px;> </span></div>";
        str += "<div class=textDiv id=" + this.parent.id + "text_" + eid + " style='clear: both; height:100%; padding:1 1 1 1;'>" + textStr + "</div>";
        return (str);
    },*/

    showIcon: function(){
        var blockid = this.id.split("e_");
        if(Wtf.get(blockid[0] + "close_" + blockid[1]))
            Wtf.get(blockid[0] + "close_" + blockid[1]).dom.style.display = "block";
        Wtf.get(blockid[0] + "text_" + blockid[1]).dom.style.textDecoration="underline";
    },

    hideIcon:function(){
        var blockid = this.id.split("e_");
        if(Wtf.get(blockid[0] + "close_" + blockid[1])){
            Wtf.get(blockid[0] + "close_" + blockid[1]).dom.style.display = "none";
        }
        Wtf.get(blockid[0] + "text_" + blockid[1]).dom.style.textDecoration="none";
    },

    createEventCell : function(eid, pid, evttime, textStr, qTipStr, h, w, CalendarID, evtTs, archived, deleteflag) {
        var editFlag=false;
        var perm=Wtf.cal.utils.getPermissionLevel(this.parent,CalendarID);
        if((perm==""||perm==1) && !archived)
            editFlag=true;

    //   var panelWindow = null;
        var styl = 'z-index:1000;position:absolute;border:1px solid; ';
        styl = styl + (deleteflag == '0') ? 'cursor:pointer;' : '';
        var panelWindow = new Wtf.Panel({
            id: this.parent.id + 'e_' + eid,
            baseCls: "dummyclass",
            html: this.eventHtmlStr(eid, evttime, textStr, qTipStr, deleteflag),
            height: h,//+"%",
            width: w + "%",
    //        animate: true,
            cls: 'innerPanel',
            border: true,
            cellId:pid.id,
            style: styl,
            ts:evtTs,
            editable:editFlag
        });


        /*if(perm==4){
            panelWindow = new Wtf.Panel({
                id: MainPanel.id + 'e_' + eid,
                baseCls: "dummyclass",
                html: _eventHtmlStr(eid, MainPanel),
                height: h,
                width: w + "%",
                animate: true,
                cls: 'innerPanel',
                border: true,
                style: 'z-index:1000;position:absolute;',
                ts:evtTs,
                editable:editFlag
            });
        }*/

    //    panelWindow.doLayout();

        var cell = pid.getXY();
        panelWindow.setPagePosition(cell[0] + 3, cell[1]);
        panelWindow.render(this.parent.id + this.parent.currentview + 'eventPanel');
        if(editFlag){
            var resizeWindow = new Wtf.Resizable(panelWindow.id, {
                id: this.parent.id + 'r_' + eid,
                height: h,//+"%",
                width: w + "%",
                border: true,
                transparent: true,
                heightIncrement: Wtf.fixHeight,
                minHeight: Wtf.fixHeight,
                handles: 'n s',
                minY: Wtf.get(this.parent.id + this.parent.currentview + 'eventPanel').getY()   // for limiting top of the drag region
            });
//        resizeWindow.on('beforeresize', checkEditable);
            resizeWindow.on('resize', this.resizeEvent);
            panelWindow.el.addListener('mouseover', this.showIcon);
            panelWindow.el.addListener('mouseout', this.hideIcon);
            if(Wtf.get(this.parent.id+"close_"+eid)){
                Wtf.get(this.parent.id+"close_"+eid).addListener('click',this.closeEvent);
            }
            this.parent.addDragCmp(panelWindow.id, true);
        }
        panelWindow.el.addListener('dblclick', this.showEventDetails);
        panelWindow.el.dom.style.position="absolute";
        panelWindow.el.dom.style.color="white";
        panelWindow.el.dom.setAttribute("Name", CalendarID);
        panelWindow.el.dom.setAttribute("peid", eid);

    //    if(perm==""||perm<=2) //drag selector er


    //    Wtf.get(this.parent.id + 'e_' + eid).dom.setAttribute("cellid", pid);
        var bool = this.parent.CheckforChecked(CalendarID);
        if (!bool)
            this.parent.HidingOtherSingleEvent(this.parent.id + 'e_' + eid);
        this.parent.ChangingOtherSingleEventColor(CalendarID, this.parent.id + 'e_' + eid);
        return panelWindow;
    },

    showEventDetails:function(e){
        e.preventDefault();
        e.stopPropagation();
        var temp=this.id.split('e_');
        var MainPanel = Wtf.getCmp(temp[0]);
        if(temp[1]&&MainPanel.eStore&&MainPanel.eStore.getCount()){
            var rec = MainPanel.eStore.find("peid", temp[1].split('CNT_')[0]);
            //var tstr=document.getElementById(temp[0]+"title_"+temp[1]).innerHTML;
            var edetails=null;
            if(rec!=-1)
                edetails=MainPanel.eStore.getAt(rec);
            if(edetails){
                var edData = edetails.data;
                var sdate=new Date(Wtf.cal.utils.sqlToJsDate(edData.startts));
                var edate=new Date(Wtf.cal.utils.sqlToJsDate(edData.endts));

                var eventData=[];
                eventData[0]=edData.subject;
                eventData[1]=edData.location;
                //eventData[2]=sdate.format("g A");
                //eventData[3]=edate.format("g A");

                //temp fix done for half an hour timestring display[Gopi]
                var sd=sdate.format("i");
                if(sd && sd!="00"){
                    eventData[2]=sdate.format("g:i A");
                }
                else{
                    eventData[2]=sdate.format("G");
                }
                var ed=edate.format("i");
                if(ed && ed!="00"){
                    eventData[3]=edate.format("g:i A");
                }
                else {
                    eventData[3]=edate.format("G");
                }
                ///////////
                eventData[4]=sdate;
                eventData[5]=edate;
                eventData[6]=edData.descr;
                eventData[7]=edData.showas;
                eventData[8]=edData.priority;
                eventData[9]=edData.recpattern;
                eventData[10] = edData.recend;
                if(edData.recend!=""){
                    eventData[10] =(Wtf.cal.utils.sqlToJsDate(edData.recend)).format("Y-m-d 00:00:00");
                    var recenddate = new Date(Wtf.cal.utils.sqlToJsDate(edData.recend));
                    eventData[12]=recenddate;
                }else{
                    eventData[10]=MainPanel.defaultTS;
                }
                eventData[11]=edData.resources;
                eventData[13] = edData.cid;
                eventData[14] = edData.allday;
                eventData[15] = edData.deleteFlag;
                MainPanel.RemoveMainPanelContent();
                var eventobj = new Wtf.cal.eventForms(MainPanel);
                eventobj.AddingTabPanelEvent();
                eventobj.AddingEventValues(eventData,this.id);
            }
            else{
                calMsgBoxShow(126, 1);
                //Wtf.Msg.alert("Invalid Event","Event doesn't exist!");
                this.destroy();
                //delete query
            }
        }
    },

    resizeEvent: function(resize, width, height, e) {
    /*function checkEditable(resiz,e){
        var rsz=this.id.split("r_");
        if(!(Wtf.getCmp(rsz[0]+"e_"+rsz[1]).editable)){
            calMsgBoxShow(116,2);
            this.enabled=false;
            e.preventDefault();
            e.stopPropagation();
        }
    }*/

        var a = resize.el;
        var a1 = a.dom.offsetHeight / Wtf.fixHeight;

        var a2 = a.dom.getElementsByTagName('span');
        a = a2[0].innerHTML;
        var a3 = a.split("-");

        var d = new Date();
        var resiz=this.id.split("r_");
        var MainPanel=Wtf.getCmp(resiz[0]);
        var t=MainPanel.eStore.find("peid",resiz[1]);

        if (this.activeHandle.position == "south") {
            //temp fix done for half an hour timestring display[Gopi]
            d = Date.parseDate(a3[0].trim(), "g:i A");
            d = d.add(Date.HOUR, a1);
    //        a2[0].innerHTML = a3[0] + "-" + d.format('g A');
            if(t!=-1){
                var recData=MainPanel.eStore.getAt(t).data;
                var startdt = Wtf.cal.utils.sqlToJsDate(recData.startts);
                var enddt = Wtf.cal.utils.sqlToJsDate(recData.endts.toString());
                var enddate = enddt.format("Y-m-d");
                var endtm = d.format("H");
                if(!(startdt.format("H") >= endtm) || endtm == "00") {
                    var allstart = startdt.format("Y-m-d");
                    if(endtm == "00")               // if the drag ends after 11pm then add 1 day end date
                        enddate = enddt.add(Date.DAY, 1).format("Y-m-d");
                    else if(allstart != enddate)    // if earlier the event ended after 11pm, and now it does not, then subtract 1 day from end date
                        enddate = enddt.add(Date.DAY, -1).format("Y-m-d");
                    // endtm=23;
                    var guestReminder = [];
                    var eRecord = [recData.eid, recData.cid, recData.startts, enddate + " " + endtm + ":00:00.0", recData.subject, recData.descr, recData.location, recData.showas, recData.priority, recData.recpattern, recData.recend, recData.resources, "", recData.allday];
                    MainPanel.updateEvent(eRecord,"0");
                }
                else {
                    e.preventDefault();
                    e.stopPropagation();
                }
            }
        }
        else {
            //temp fix done for half an hour timestring display[Gopi]
            d = Date.parseDate(a3[1].trim(), "g:i A");
            d = d.add(Date.HOUR, -a1);
    //        a2[0].innerHTML = d.format('g A') + a3[1];
            if(t!=-1){
                recData = MainPanel.eStore.getAt(t).data;
                var startdate=Wtf.cal.utils.sqlToJsDate(recData.startts.toString());
                startdate=startdate.format("Y-m-d");
                endtm = d.format("H").toString();
                var endH = Wtf.cal.utils.sqlToJsDate(recData.endts).format("H").toString();
                if(endH >= endtm || endH == "00") {
                    var guestReminder = [];
                    eRecord = [recData.eid, recData.cid, startdate + " " + endtm + ":00:00.0", recData.endts, recData.subject, recData.descr, recData.location, recData.showas, recData.priority, recData.recpattern, recData.recend, recData.resources, "", recData.allday];
                    MainPanel.updateEvent(eRecord,"0");
                }
                else {
                    e.preventDefault();
                    e.stopPropagation();
                }
            }
        }
    },

    getDateAndValue:function(e, TodayMonth, TodayYear) {
        var TodayMonth1 = TodayMonth;
        var TodayYear1 = TodayYear;

        var dy=e.target.id.split("Day1");
        if(!dy[1]){
            dy=e.target.parentNode.id.split("Day1");
            if(!dy[1]){
                return null;
                /*if(e.target.class=="eventPanel"){
                    dy=e.target.parentNode.parentNode.parentNode.id.split("Day1");
                }
                else{
                    dy=e.target.parentNode.parentNode.id.split("Day1");
                }*/
            }
        }
        var dyMnt=dy[1].split("/");
        var dt;
        if(!dyMnt[1]){
            dt=Date.parseDate(dyMnt[0] +"/" + TodayMonth1 + "/" + TodayYear1,"d/n/Y");
            this.parent.changeCalDate(dt);
        }
        else{
            if(dyMnt[1] < TodayMonth1){
                if(dyMnt[1]==1 && TodayMonth1==12){
                    TodayMonth1=dyMnt[1];
                    TodayYear1++;
                }
                else{
                    TodayMonth1--;
                }
            }
            else{
                if(dyMnt[1]==12 && TodayMonth1==1){
                    TodayMonth1=dyMnt[1];
                    TodayYear1--;
                }
                else{
                    TodayMonth1++;
                }
            }
            dt = new Date();
            dt = Date.parseDate(TodayYear1 +"-"+ TodayMonth1 +"-"+ dyMnt[0],"Y-n-j");
            this.parent.RemoveMainPanelContent();
            this.parent.changeCalDate(dt);
            this.parent.RemoveDiv();
            this.parent.AddMonth();

            var dd = this.parent.calendar.getValue();
            var obj1 = Wtf.getCmp(this.parent.id + 'dateText1');
            obj1.setText(Date.monthNames[dd.getMonth()] + " " + dd.getFullYear());
            this.parent.seldate = dd;
            this.parent.onCalViewChange();
        }
        return dt;
    },

    showWindowWeek:function(activecell1, timeStr1, h11, w11, buttonFlag, monthView, allDayView) {
        var _parId = this.parent.id;
        var winForm = Wtf.getCmp(_parId + 'OtherWinShow');
        var h= 365;
        if (!winForm) {
            h = 340;
            if (Wtf.isIE) {
                h = 374;
            }
            //var view = 'week';
            var topForm = this.getTopFormPanel();
            var centerForm = this.getCenterFormPanel(t, t);
            var bottomForm = this.getBottomFormPanel();
            var win = new Wtf.Window({
                title: WtfGlobal.getLocaleText('pm.event.create'),
                id: _parId + 'OtherWinShow',
                closable: true,
                cls: 'fontstyle',
                iconCls : 'iconwin',
                resizable: false,
                modal: true,
                width: 400,
                height: h,
                layout: 'border',
                items: [topForm,centerForm,bottomForm],
                closeAction:'hide',
                buttons: [{
                    cls: 'padd',
                    text: WtfGlobal.getLocaleText('pm.project.calendar.newevent.addmore'),
                    id: _parId + 'addDetailsweek'
                }, {
                    text: WtfGlobal.getLocaleText('lang.OK.text'),
                    id: _parId + 'okweek'
                },{
                    text: WtfGlobal.getLocaleText('lang.cancel.text'),
                    id: _parId + 'cancelweek'
                }]
            });
            win.show();
            Wtf.get(_parId + 'cancelweek').addListener('click', this.CancelfuncWeek, this);
            Wtf.get(_parId + 'addDetailsweek').addListener('click', this.addDetailsForm1, this);
            Wtf.get(_parId + 'okweek').addListener('click', this.OkfuncWeek, this);
            var p = Wtf.getCmp(_parId + 'CheckAllDayweek').addListener('check', this.oncheck, this);
        }else{
            winForm.show();
        }
        if((!monthView || monthView == undefined) && (!allDayView || allDayView == undefined)) {
            // if not month view or Week View's all day then show time fields
            Wtf.getCmp(this.parent.id + 'timePan').show();
            Wtf.getCmp(_parId + 'CheckAllDayweek').setValue(false);
            var date = this.parent.calendar.getValue();
            var edate = date;
        }
        else {
            // if month view or Week View's all day then hide time fields and set them to their default values
            Wtf.getCmp(_parId + 'stimeweek').setValue("9");
            Wtf.getCmp(_parId + 'etimeweek').setValue("10");
            Wtf.getCmp(this.parent.id + 'timePan').hide();
            date = timeStr1.split("/")[0] + " " + "00:00:00";
            date = Wtf.cal.utils.sqlToJsDate(date.toString());
            edate = timeStr1.split("/")[1] + " " + "00:00:00";
            edate = Wtf.cal.utils.sqlToJsDate(edate.toString());
            if(date.getTime() > edate.getTime()) {
                var sortDate = date;
                date = edate;
                edate = sortDate;
            }
        }
        if(!buttonFlag && (!allDayView || allDayView == undefined)) {
            if (this.parent.currentview == ('WeekView')) {
                var a = activecell1.split('_');
                a = parseInt(a[2], 10);
                a = a - date.format('w');
                date = date.add(Date.DAY, a);
                edate = edate.add(Date.DAY, a);
            }
            else if (this.parent.currentview == ('WorkWeekView')){
                var a = activecell1.split('_');
                a = parseInt(a[2], 10);
                a = a - date.format('w');
                date = date.add(Date.DAY, a);
                edate = edate.add(Date.DAY, a);
            }
        }
        var t = date.format('m') + "/" + date.format('d') + "/" + date.format('Y');
        this.activeCells = activecell1;
        if(buttonFlag)
            timeStr1 = "9-10";
        this.timeString = timeStr1;
        this.heighttoevent = h11;
        this.widthtoevent = w11;
        timeStr1 = timeStr1.split('-');
        if((parseInt(timeStr1[0]) > parseInt(timeStr1[1])) && (!monthView || monthView == undefined) && (!allDayView || allDayView == undefined)) {
            // if not monthView or alldayView in day/work-week/week view and start time is greater than end time then sort them
            var tempTime = timeStr1[0];
            timeStr1[0] = timeStr1[1];
            timeStr1[1] = tempTime;
        }
        if(timeStr1[1]==48 && (!monthView || monthView == undefined) && (!allDayView || allDayView == undefined)) {
            // if end time is 24 hours then add 1 day to end date
            timeStr1[1] = 0;
            edate = edate.add(Date.DAY, 1);
        }
        Wtf.getCmp(_parId + 'calendarweek').setValue(this.parent.tempCalStore.getAt(0).data["id"]);
        Wtf.getCmp(_parId + 'subjectweek').setValue('');
        Wtf.getCmp(_parId + 'locationweek').setValue('');
        Wtf.getCmp(_parId + 'sdateweek').setValue(date);
        Wtf.getCmp(_parId + 'edateweek').setValue(edate);
        if((!monthView || monthView == undefined) && (!allDayView || allDayView == undefined)) {
            // if not all day event then set the time field
            Wtf.getCmp(_parId + 'stimeweek').setValue(timeStr1[0]);
            Wtf.getCmp(_parId + 'etimeweek').setValue(timeStr1[1]);
        }
        else {
            // if all day event then hide the time field
            Wtf.getCmp(_parId + 'CheckAllDayweek').setValue(true);
        }
        Wtf.getCmp(_parId + 'Showasweek').setValue('b');
        Wtf.getCmp(_parId + 'priorityweek').setValue('m');
//        Wtf.getCmp(_parId + 'Reminderweek').setValue('none');
    //        Wtf.getCmp(_parId + 'ReminderTimeweek').setValue('----------');
        Wtf.getCmp(_parId + 'subjectweek').clearInvalid();
        Wtf.getCmp(_parId + 'subjectweek').focus(false, 1000);
    },



    addDetailsForm1:function (){

        var a = [];
        var _parId = this.parent.id;
        a[0] = Wtf.get(_parId + 'subjectweek').getValue();
        a[1] = Wtf.get(_parId + 'sdateweek').getValue();
        a[2] = Wtf.get(_parId + 'edateweek').getValue();
        a[3] = Wtf.getCmp(_parId + 'stimeweek').getValue();
        a[4] = Wtf.getCmp(_parId + 'etimeweek').getValue();
        a[5] = Wtf.get(_parId + 'locationweek').getValue();
        a[6] = Wtf.getCmp(_parId + 'Showasweek').getValue();
        a[7] = Wtf.getCmp(_parId + 'priorityweek').getValue();
        a[8] = Wtf.getCmp(_parId + 'CheckAllDayweek').getValue();
        a[9] = "0";
    //    a[8] = Wtf.getCmp(_parId + 'Reminderweek').getValue();
    //    a[9] = Wtf.getCmp(_parId + 'ReminderTimeweek').getValue();

        Wtf.getCmp(_parId + 'OtherWinShow').hide();
        this.parent.RemoveMainPanelContent();
        //Wtf.fly(el) error occurs if not done this way
        var MainPanel = Wtf.getCmp(_parId);
        var eventfrm = new Wtf.cal.eventForms(MainPanel);
        eventfrm.AddingTabPanelEvent();
        eventfrm.AddingValue(a);
        Wtf.getCmp(_parId + 'subjectweek').focus(false, 100);
        Wtf.getCmp(_parId + 'subjectweek').clearInvalid();
    },

    getTopFormPanel : function(){
        var simHeight = 100;
        var cwidth = 270;
        if (Wtf.isGecko) {
            simHeight = 98;
            cwidth = 275;
        }
        if (Wtf.isIE) {
            simHeight = 107;
            cwidth = 265;
        }

        var simple = new Wtf.FormPanel({
            labelWidth: 75,
            border: true,
            id: this.parent.id + 'f1',
            frame: true,
            bodyStyle: 'padding:5px 5px 0',
            width: 250,
            height: simHeight,
            defaultType: 'textfield',
            region: 'north',
            items: [{
                fieldLabel: WtfGlobal.getLocaleText('lang.subject.text')+'*',
                name: 'subject',
                id: this.parent.id + 'subjectweek',
                width: 275,
                maxLength: 100,
                allowBlank: false

            }, {
                fieldLabel: WtfGlobal.getLocaleText('lang.location.text'),
                id: this.parent.id + 'locationweek',
                width: 275,
                maxLength: 1024,
                name: 'location'
            }, {
                xtype :'combo',
                id: this.parent.id + 'calendarweek',
                fieldLabel: WtfGlobal.getLocaleText('pm.project.calendar.text')+'*',
                store: this.parent.tempCalStore,
                //cls: 'winshow',
                valueField:'id',
                //value: this.parent.tempCalStore.getAt(0).json[1],
                displayField: 'state1',
                typeAhead: true,
                mode: 'local',
                editable: false,
                triggerAction: 'all',
                selectOnFocus: true,
                width: cwidth
            }]
        });
        Wtf.getCmp(this.parent.id + 'subjectweek').on("change", function(){
            Wtf.getCmp(this.parent.id + 'subjectweek').setValue(WtfGlobal.HTMLStripper(Wtf.getCmp(this.parent.id + 'subjectweek').getValue()));
        }, this);
        Wtf.getCmp(this.parent.id + 'locationweek').on("change", function(){
            Wtf.getCmp(this.parent.id + 'locationweek').setValue(WtfGlobal.HTMLStripper(Wtf.getCmp(this.parent.id + 'locationweek').getValue()));
        }, this);
        focusOn(this.parent.id + 'subjectweek');
        return simple;

    },

    getCenterFormPanel : function(k, k1){
        var simple1 = new Wtf.FormPanel({
            labelWidth: 75,
            id: this.parent.id + 'f2',
            frame: true,
            xtype: 'fieldset',
            border: true,
            bodyStyle: 'padding:0px 5px 0px',
            width: 250,
            height: 80,
            region: 'center',
            layout: 'column',
            items: [{
                columnWidth: 0.5,
                layout: 'form',
                items: [{
                    xtype : 'checkbox',
                    id: this.parent.id + 'CheckAllDayweek',
                    boxLabel: WtfGlobal.getLocaleText('pm.project.calendar.newEvent.allDay'),
                    hideLabel: true
                }, {
                    xtype : 'datefield',
                    fieldLabel: WtfGlobal.getLocaleText('pm.project.calendar.newevent.startdate'),
                    readOnly: true,
                    format: WtfGlobal.getOnlyDateFormat(),
                    //format: 'm/d/Y',
                    value: k,
                    id: this.parent.id + 'sdateweek',
                    anchor: '95%'
                },{
                    xtype : 'datefield',
                    layout: 'form',
                    readOnly: true,
                    format: WtfGlobal.getOnlyDateFormat(),
                    //format: 'm/d/Y',
                    value: k1,
                    fieldLabel: WtfGlobal.getLocaleText('pm.common.enddate'),
                    id: this.parent.id + 'edateweek',
                    anchor: '95%'
                }]
            }, {
                columnWidth: 0.5,
                bodyStyle: 'padding:33px 0px 0px 0px',
                id: this.parent.id + 'timePan',
                layout: 'form',
                items: [{
                    xtype : 'combo',
                    fieldLabel: WtfGlobal.getLocaleText('pm.project.calendar.newevent.starttime'),
                    id: this.parent.id + 'stimeweek',
                    store: this.store3,
                    maxHeight:150,
                    editable: false,
                    displayField: 'disp',
                    valueField:'abbr1',
                    typeAhead: true,
                    mode: 'local',
                    triggerAction: 'all',
                    selectOnFocus: true,
                    anchor: '95%'
                },{
                    xtype : 'combo',
                    fieldLabel: WtfGlobal.getLocaleText('pm.project.calendar.newevent.endtime'),
                    name: 'etime',
                    id: this.parent.id + 'etimeweek',
                    store: this.store3,
                    valueField:'abbr1',
                    maxHeight:150,
                    editable: false,
                    displayField: 'disp',
                    typeAhead: true,
                    mode: 'local',
                    triggerAction: 'all',
                    selectOnFocus: true,
                    anchor: '95%'
                }]
            }]
        });

        return simple1;
    },

    getBottomFormPanel : function(){
        var simHeight = 80;
        if (Wtf.isGecko) {
            simHeight = 72;
        }
        if (Wtf.isIE) {
            simHeight = 87;
        }
        var simple2 = new Wtf.FormPanel({
            labelWidth: 75,
            frame: true,
            id: this.parent.id + 'f3',
            border: false,
            xtype: 'fieldset',
            bodyStyle: 'padding:5px 5px 10px',
            width: 250,
            height: simHeight,
            region: 'south',
            layout: 'column',
            items: [{
                columnWidth: 0.5,
                layout: 'form',
                items: [{
                    xtype : 'combo',
                    id: this.parent.id + 'Showasweek',
                    fieldLabel: WtfGlobal.getLocaleText('pm.project.calendar.newevent.showas'),
                    value:'b',
                    store: this.storeShowas,
                    editable: false,
                    displayField: 'state1',
                    typeAhead: true,
                    valueField:'abbr1',
                    mode: 'local',
                    triggerAction: 'all',
                    selectOnFocus: true,
                    anchor: '95%'
                }/*, new Wtf.form.ComboBox({
                    id: this.parent.id + 'Reminderweek',
                    fieldLabel: WtfGlobal.getLocaleText('pm.common.reminder'),
                    emptyText: WtfGlobal.getLocaleText('lang.None.text'),
                    store: this.storeReminder,
                    editable: false,
                    displayField: 'state1',
                    valueField:'abbr1',
                    typeAhead: true,
                    mode: 'local',
                    triggerAction: 'all',
                    selectOnFocus: true,
                    anchor: '95%'
                })*/]
            }, {
                columnWidth: 0.5,
                layout: 'form',
                items: [{
                    xtype : 'combo',
                    id: this.parent.id + 'priorityweek',
                    fieldLabel: WtfGlobal.getLocaleText('lang.priority.text'),
                    name: 'markas',
                    value:'m',
                    store: this.store4,
                    editable: false,
                    valueField:'abbr',
                    displayField: 'state',
                    typeAhead: true,
                    mode: 'local',
                    triggerAction: 'all',
                    selectOnFocus: true,
                    anchor: '95%'
                }/*, new Wtf.form.ComboBox({
                    fieldLabel: WtfGlobal.getLocaleText('lang.time.text'),
                    id: this.parent.id + 'ReminderTimeweek',
                    store: this.storereminderTime,
                    editable: false,
                    emptyText: ' ---------- ',
                    displayField: 'state1',
                    valueField:'abbr1',
                    typeAhead: true,
                    mode: 'local',
                    triggerAction: 'all',
                    selectOnFocus: true,
                    anchor: '95%'
                })*/]
            }]
        });
    //    Wtf.getCmp(this.parent.id + 'Reminderweek').on("select", function(obj, nv, ov){
    //        Wtf.getCmp(this.parent.id + 'ReminderTimeweek').setValue(5);
    //    }, this);
        return simple2;
    },

    oncheck : function(q, p){
        if (p)
            Wtf.getCmp(this.parent.id + 'timePan').hide();
        else
            //var startTime = Wtf.get(this.parent.id + 'timePan');
            Wtf.getCmp(this.parent.id + 'timePan').show();
    }

});
/*===================================weekwinshow.js end ======================*/


/*//FILE:===========================draggable.js==============================*/
Wtf.cal.DDProxy = function(id, sGroup, config) {
    if (id) {
        this.init(id, sGroup, config);
        this.initFrame();
    }
};

Wtf.extend(Wtf.cal.DDProxy,Wtf.dd.DDProxy, {
    startDrag: function(x, y){
        /*var editable=Wtf.get(this.id).dom.getAttribute('editable');
        if(editable=="false"){
            Wtf.Msg.alert('Invalid Operation', 'You dont have sufficient privileges to modify this event!');
            return false;
        }*/
        var dragEl = Wtf.get(this.getDragEl());
        var el = Wtf.get(this.getEl());
        /*totalEventDays = eventHash.get(el.dom.id);
        if(totalEventDays > 0 && AddedDays==false)
        {
            AddedDays=true;
            dragTempInnerHTML = el.dom.innerHTML;
            el.dom.innerHTML = "(" + (totalEventDays+1) +  " days)"+el.dom.innerHTML;
        }*/

        dragEl.applyStyles({
            border: '',
            'z-index': 2000,
            backgroundColor: el.dom.style.backgroundColor
        });
        dragEl.update(el.dom.innerHTML);
        dragEl.addClass(/*el.dom.className + */' dd-proxy');
    },

    onDragOver: function(e, targetId){
        var target = Wtf.get(targetId);
        this.lastTarget = target;
        target.addClass('DragClass');
    },

    onDragOut: function(e, targetId){
        var target = Wtf.get(targetId);
        this.lastTarget = null;
        target.removeClass('DragClass');
    },

    endDrag: function(e){
        var MainPanel = Wtf.getCmp(this.id.split("e_")[0]);
        var dragEl = Wtf.get(this.getDragEl());
        var el = Wtf.get(this.getEl());
        var t = Wtf.get(this.lastTarget);
        if(t && (t.id.indexOf('Day1') != -1 || t.id.indexOf('_allDay_') != -1)) {
            t = (t.id);
            if(t.indexOf('Day1') != -1)
                t = t.split('Day1');
            else
                t = t.split('_allDay_');
            if ((el.id.indexOf('Showing')) >= 0) {
                var t1 = Wtf.get(MainPanel.id+"e_" + t[1]);
                //var t1 = document.getElementById(t[0]);
                var el = t1.dom.cloneNode(true);
                t1.dom.parentNode.removeChild(t1);
            }
            /*if(AddedDays == true)
                {
                    AddedDays = false;
                    el.dom.innerHTML = dragTempInnerHTML;
                    MainPanel.MakingMoreDaysEventRemove(dragTempInnerHTML,totalEventDays,t[1]);
                    this.lastTarget.removeClass('DragClass');
                }*/

            if (this.lastTarget) {
                //Wtf.get(this.lastTarget).appendChild(el);
                //el.applyStyles({position:'', width:''});
                this.lastTarget.removeClass('DragClass');
            }

            if ('function' === typeof this.config.fn) {
                this.config.fn.apply(this.config.scope || window, [this, this.config.dragData]);
            }
            if (MainPanel.currentview == "MonthView" && !MainPanel.ifArrayContains((e.getTarget().childNodes[0].innerHTML))) {
                MainPanel.AddToArray(e.getTarget().childNodes[0].innerHTML);
            }

            //updation part
            // Fetch the "date1" either from lastTarget or global startdate
            if(this.lastTarget.id.indexOf("Day1") != -1)
                var date1 = this.lastTarget.id.split("Day1")[1];
            else
                date1 = MainPanel.startdate.add(Date.DAY, parseInt(t[1])).format("Y-m-d");

            if(MainPanel.eStore) {
                var index = MainPanel.eStore.find("peid",this.id.split('e_')[1].split('CNT_')[0]);
                if(index != -1) {
                    var recData = MainPanel.eStore.getAt(index).data;
                    var startdate = Wtf.cal.utils.sqlToJsDate(recData.startts.toString());
                    var enddate = Wtf.cal.utils.sqlToJsDate(recData.endts.toString());

                    if(recData.allday)      // if event is all day then add 1 day to end date
                        enddate = enddate.add(Date.DAY, 1);

                    // Calculating the new start date from "date1"
                    if(this.lastTarget.id.indexOf("Day1") != -1)
                        var newStartDate1 = MainPanel.startdate.format('Y-m-') + date1 + startdate.format(' H:i:s');
                    else
                        newStartDate1 = date1 + startdate.format(' H:i:s');

                    newStartDate1 = Wtf.cal.utils.sqlToJsDate(newStartDate1.toString());

                    // Calculate the diff in new and old start dates
                    var dayDiff = Wtf.cal.utils.DateDiff(newStartDate1, startdate);

                    // Add diff to end date to calculate new end date
                    var newEndDate = new Date(enddate);
                    newEndDate.setDate(enddate.getDate() + dayDiff);

                    var eRecord = [recData.eid, recData.cid, newStartDate1.format("Y-m-d H:i:s"), newEndDate.format("Y-m-d H:i:s"), recData.subject, recData.descr, recData.location, recData.showas, recData.priority, recData.recpattern, recData.recend, recData.resources, "", recData.allday];
                    MainPanel.updateEvent(eRecord,"0");
                }
            }
            var draggedEl = Wtf.get("ygddfdiv").dom;    // [Temp fix] for deleting the internally created drag element
            if(draggedEl) {
                var draggedElParent = draggedEl.parentNode;
                draggedElParent.removeChild(draggedEl);
            }
        }
        else    // stop drag event if event not dropped in the proper day
             e.stopEvent();
    }
});
/*============================draggable.js====================================*/

/*//FILE:============================ddd.js===================================*/

Wtf.cal.EventDZ = function(el, config){
    config = config ||
    {};
    Wtf.apply(config, {
        ddel: document.createElement('div')
    });
    Wtf.cal.EventDZ.superclass.constructor.call(this, el, config);
};

Wtf.extend(Wtf.cal.EventDZ, Wtf.dd.DragZone, {
    getDragData: function(e){
        var target = Wtf.get(e.getTarget());
        if (target.hasClass('dd-ct')) {
            return false;
        }
        return {
            ddel: this.ddel,
            item: target
        };
    },
    onInitDrag: function(e){
        this.ddel.innerHTML = this.dragData.item.dom.innerHTML;
        this.ddel.className = this.dragData.item.dom.className;
        this.ddel.style.width = this.dragData.item.dom.offsetWidth + "px";
        this.proxy.update(this.ddel);
    },
    getRepairXY: function(e, data){
        data.item.highlight('#e8edff');
        return data.item.getXY();
    }
});

Wtf.cal.EventDT = function(el, config){
    Wtf.cal.EventDT.superclass.constructor.call(this, el, config);
};

Wtf.extend(Wtf.cal.EventDT, Wtf.dd.DropTarget, {
    notifyDrop: function(dd, e, data){
        var MainPanel = Wtf.cal.utils.getCalCtrl();//Wtf.getCmp(MainPanel.id);
        if (data.item.id.search(MainPanel.id + "e_") == 0 || data.item.id.search(MainPanel.id + "title_") == 0 || data.item.id.search(MainPanel.id + "wrapper_") == 0 || data.item.id.search(MainPanel.id + "text_") == 0 || data.item.id.search(MainPanel.id + "calImg_") == 0) {
            var idd = data.item.id.split('_');
            var dnode = Wtf.getCmp(MainPanel.id + 'e_' + idd[1]);

            if(!dnode.editable){
                calMsgBoxShow(116, 1);
                //Wtf.Msg.alert('Invalid Operation', 'You dont have sufficient privileges to modify this event!');
                return false;
            }

//            this.el.removeClass(this.overClass);
            var cell = this.el.getXY();
            var eTitle=Wtf.get(MainPanel.id + 'title_' + idd[1]);
            var objT = eTitle.dom.innerHTML.split('-');
            var st = Wtf.cal.utils.getTimeIndNo(objT[0], false);
            var ed = Wtf.cal.utils.getTimeIndNo(objT[1], true);
            var wid = ed - st;
            var dragObj = this.id.split('_');

            var startHr=parseInt(dragObj[1]);
            if((startHr < 0)||((startHr + wid) > 24)){
                return false;
            }
            var stArr = [];
            var endArr = [];
            stArr = Wtf.cal.utils.getHourStr(startHr);
            endArr = Wtf.cal.utils.getHourStr(startHr + wid);//,true);

            var newTimeStr = stArr[0] + stArr[1] + "-" + endArr[0] + endArr[1];

            eTitle.innerHTML = newTimeStr;
            dnode.el.fadeIn({
                duration: 0.5
            });
            dnode.setPagePosition(cell[0], cell[1]);
            dnode.render(MainPanel.id + MainPanel.currentview + 'eventPanel');

            var t=MainPanel.eStore.find("peid", idd[1].split("CNT_")[0]);

            if(t!=-1){
                var recData=MainPanel.eStore.getAt(t).data;
                var stdt=Wtf.cal.utils.sqlToJsDate(recData.startts.toString());
                var endt=Wtf.cal.utils.sqlToJsDate(recData.endts.toString());

                var w1=0;
                var diff=0;
                if(MainPanel.currentview!="DayView"){
                    w1=stdt.format('w');
                    if(MainPanel.currentview!="WorkWeekView"){
                        diff=dragObj[2]-w1;
                    }
                    else{
                        diff=dragObj[2]-w1+1;
                    }
                }
                stdt.setDate(stdt.getDate()+diff);
                endt.setDate(endt.getDate()+diff);

                st = Wtf.cal.utils.getTimeIndNo(stArr[0]+stArr[1], false);
                ed = Wtf.cal.utils.getTimeIndNo(endArr[0]+endArr[1], true);

                stdt.setHours(st,0,0);
                endt.setHours(ed,0,0);
                if(Wtf.cal.utils.getTimeIndNo(objT[1], true) == "24")
                    endt = endt.add(Date.DAY, -1);
                var eRecord=[recData.eid, recData.cid, stdt.format("Y-m-d H:i:s"), endt.format("Y-m-d H:i:s"), recData.subject, recData.descr, recData.location, recData.showas, recData.priority, recData.recpattern, recData.recend, recData.resources, "",  recData.allday];
                MainPanel.updateEvent(eRecord,"0");
            }
            return true;
        }
        else
            return false;
    }
});
/*===================================ddd.js===================================*/
