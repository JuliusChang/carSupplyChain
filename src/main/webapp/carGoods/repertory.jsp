<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>第一个 ECharts 实例</title>
    <!-- 引入 echarts.js -->
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 600px;height:400px;"></div>

<div id="main1" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '订单'
        },
        tooltip: {},
        legend: {
            data:['数量']
        },
        xAxis: {
            data: ["后视镜","玻璃","前灯","保险杠"]
        },
        yAxis: {},
        series: [{
            name: '数量',
            type: 'bar',
            data: [5, 20, 36, 10]
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);


    var myChart = echarts.init(document.getElementById('main1'));
    option = {
        title : {
            text: '库存',       //大标题
            subtext: '详细',                //类似于副标题
            x:'center'                 //标题位置   居中
        },
        tooltip : {
            trigger: 'item',           //数据项图形触发，主要在散点图，饼图等无类目轴的图表中使用。
            formatter: "{a} <br/>{b} : {c} ({d}%)"   //{a}（系列名称），{b}（数据项名称），{c}（数值）, {d}（百分比）用于鼠标悬浮时对应的显示格式和内容
        },
        legend: {                           //图例组件。
            orient: 'vertical',             //图例列表的布局朝向
            left: 'left',
            data: ['后视镜','玻璃','前灯','保险杠']
        },
        series : [              //系列列表。每个系列通过 type 决定自己的图表类型
            {
                name: '访问来源',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[
                    {value:94, name:'后视镜'},
                    {value:63, name:'前灯'},
                    {value:79, name:'保险杠'},
                    {value:89, name:'玻璃'},
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    myChart.setOption(option);
</script>
</body>
</html>