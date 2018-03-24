<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>第一个 Highcharts 图表</title>
</head>
<body>
    <!-- 图表容器 DOM -->
    <div id="container" style="width: 1200px;height:600px;margin-bottom:30px;"></div>
    <div id="container1" style="width: 1200px;height:600px;"></div>
    <div id="container2" style="height: 400px; margin: auto; min-width: 310px; max-width: 600px"></div>
    <!-- 引入 highcharts.js -->
    <script src="https://img.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
    <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
    <script src="https://img.hcharts.cn/highcharts/highcharts-more.js"></script>
    <script>
        // 图表配置
        var options = {
            chart: {
                type: 'column'//指定图表的类型，默认是折线图（line）
            },
            title: {
                text: '健康报告'                 // 标题
            },
            xAxis: {
                categories: ['心率', '血压','呼吸','体温']   // x 轴分类
            },
            yAxis: {
                title: {
                    text: '数值'                // y 轴标题
                }
            },
            series: [{                              // 数据列
                name: '标准低值',                        // 数据列名
                data: [60, 90, 16,36.1]                     // 数据
            }, {
                name: '患者',
                data: [65, 110, 20,36.8]
            },{
                name: '标准值高值',
                data: [100, 140, 20,37.2]
        }]
        };
        // 图表初始化函数
        var chart = Highcharts.chart('container', options);
         var options = {
            chart: {
                type: 'spline'                          //指定图表的类型，默认是折线图（line）
            },
            title: {
                text: '心率统计'                 // 标题
            },
            xAxis: {
                categories: ['1月', '2月', '3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']   // x 轴分类
            },
            yAxis: {
                title: {
                    text: '数值'                // y 轴标题
                }
            },
            series: [{                              // 数据列
                name: '患者',                        // 数据列名
                data: [67, 70, 72,87,70,77,74,89,{y:103,color:'#ff0000'},87,84,70]                     // 数据
            }]
        };
        // 图表初始化函数
        var chart = Highcharts.chart('container1', options);
        var chart;
        $(function () {
            $('#container2').highcharts({
                chart: {
                    zoomType: 'xy'
                },
                title: {
                    text: '误差图'
                },
                xAxis: [{
                    categories: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
                }],
                yAxis: [{ // Secondary yAxis
                    title: {
                        text: '降水',
                        style: {
                            color: Highcharts.getOptions().colors[0]
                        }
                    },
                    labels: {
                        format: '{value} mm',
                        style: {
                            color: Highcharts.getOptions().colors[0]
                        }
                    },
                    opposite: true
                }],
                tooltip: {
                    shared: true
                },
                plotOptions: {
                    errorbar: {
                        lineWidth: 2,
                        whiskerWidth: 1,
                        stemColor: 'red',
                        // stemDashStyle: 'Dash',
                        whiskerLength: '40%'
                    }
                },
                series: [{
                    name: '降水',
                    type: 'column',
                    data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
                    tooltip: {
                        pointFormat: '<span style="font-weight: bold; color: {series.color}">{series.name}</span>: <b>{point.y:.1f} mm</b> '
                    }
                }, {
                    name: '降雨误差',
                    type: 'errorbar',
                    data: [[48, 51], [68, 73], [92, 110], [128, 136], [140, 150], [171, 179], [135, 143], [142, 149], [204, 220], [189, 199], [95, 110], [52, 56]],
                    tooltip: {
                        pointFormat: '(误差范围: {point.low}-{point.high} mm)<br/>'
                    }
                }]
            });
        });

    </script>
</body>
</html>
