<div id="monitor" class="easyui-layout" data-options="fit:true">
    <div data-options="region:'center',border:false">
        <table class="easyui-datagrid" height="100%" data-options="view:bufferview,toolbar:'#toolbar',pageSize:100,singleSelect:true,border:false,fitColumns:true">
        </table>
        <div id="toolbar">
            <a href="javascript:void(0);" class="easyui-linkbutton status-btn1" data-options="plain:true,toggle:true,group:'g1',selected:true">Все</a> |
            <a href="javascript:void(0);" class="easyui-linkbutton status-btn2" data-options="plain:true,toggle:true,group:'g1'">Идет экзамен</a> |
            <a href="javascript:void(0);" class="easyui-linkbutton status-btn3" data-options="plain:true,toggle:true,group:'g1'">Ожидают</a>
            <input name="date-search" class="easyui-datebox date-search" style="width:110px;" data-options="prompt:'Показать на...'">
            <input name="text-search" class="easyui-searchbox text-search" style="width:300px;" data-options="prompt:'Введите текст...'">
            <button class="easyui-linkbutton grid-reload" data-options="iconCls:'pagination-load',plain:true"></button>
        </div>
    </div>
    <div data-options="region:'south',border:false">
        <div class="easyui-panel" style="padding:5px;height:28px;" data-options="fit:true">
            <span class="easyui-linkbutton" data-options="plain:true,iconCls:'fa fa-clock-o'">Текущее время: <strong class="time-widget">00:00:00</strong></span>
            <span class="easyui-linkbutton" data-options="plain:true,iconCls:'fa fa-user'"><span class="loguser-widget">...</span></span>
            <a href="javascript:void(0)" class="easyui-linkbutton app-logout" data-options="iconCls:'fa fa-sign-out'" style="float:right;">Выход</a>
        </div>
    </div>
</div>
<div id="exam-info-dlg" class="easyui-dialog" title="Информация об экзамене" style="width:600px;height:400px;" data-options="iconCls:'fa fa-info-circle',resizable:true,modal:true,closed:true">
</div>
<script type="text/template" id="exam-info-tpl">
<table width="100%" height="100%" cellpadding="5">
    <tr>
        <td><strong>Идентификатор:</strong></td>
        <td>
            <%= examId %>
        </td>
    </tr>
    <tr>
        <td><strong>Экзамен:</strong></td>
        <td>
            <%= subject.title %><br>
            <%= subject.code %> - <%= subject.speciality %>
        </td>
    </tr>
    <tr>
        <td><strong>Начало:</strong></td>
        <td>
            <%= moment(beginDate).format('DD.MM.YYYY HH:mm') %>
            <% if(startDate != null) { %>
                (<%= moment(startDate).format('HH:mm') %>)
            <% } %>
        </td>
    </tr>
    <tr>
        <td><strong>Окончание:</strong></td>
        <td>
            <%= moment(endDate).format('DD.MM.YYYY HH:mm') %> 
            <% if(stopDate != null) { %>
                (<%= moment(stopDate).format('HH:mm') %>)
            <% } %>
        </td>
    </tr>
    <tr>
        <td><strong>Продолжительность:</strong></td>
        <td>
            <% if(startDate != null) {
                startDate = moment(startDate);
                if (stopDate != null) stopDate = moment(stopDate);
                else stopDate = moment(); %>
                <%= moment(stopDate.diff(startDate)).utc().format('HH:mm:ss') %>
            <% } %>
        </td>
    </tr>
    <tr>
        <td><strong>Студент:</strong></td>
        <td>
            <% if(student) { %>
                <%= student.lastname %> <%= student.firstname %> <%= student.middlename %> (<%= moment(student.birthday).format('DD.MM.YYYY') %>)
            <% } %>
        </td>
    </tr>
    <tr>
        <td><strong>Инспектор:</strong></td>
        <td>
            <% if(curator[0]) { %>
                <%= curator[0].lastname %> <%= curator[0].firstname %> <%= curator[0].middlename %>
            <% } %>
        </td>
    </tr>
    <tr>
        <td><strong>Кураторы:</strong></td>
        <td>
            <% curator.shift(); %>
            <% _.each(curator, function(item) { %>
                <%= item.lastname %> <%= item.firstname %> <%= item.middlename %><br>
            <% }); %>
        </td>
    </tr>
    <tr>
        <td><strong>Заключение:</strong></td>
        <td>
            <% if(resolution === true) { %> <span style="color: green">Принят</span> <% } %>
            <% if(resolution === false) { %> <span style="color: red">Прерван</span> <% } %>
        </td>
    </tr>
    <tr>
        <td><strong>Комментарий:</strong></td>
        <td><%= comment %></td>
    </tr>
</table>
</script>