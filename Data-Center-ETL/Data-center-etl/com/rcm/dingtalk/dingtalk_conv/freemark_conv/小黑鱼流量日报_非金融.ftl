***************************
${title}
(整体&非金融)
${yesterdaydatetime?string["yyyy-MM-dd"]}
***************************
<#setting locale="zh_CN">
访客 ${e101.now?string(',###')}
(日 <#if e101.lastDay != 0>${(e101.now-e101.lastDay )/e101.lastDay *100}%<#else>-</#if> 周 <#if e101.lastWeek != 0>${(e101.now-e101.lastWeek)/e101.lastWeek*100}%<#else>-</#if>)
访客(除积分墙) ${e3801.now?string(',###')}
(日 <#if e3801.lastDay != 0>${(e3801.now-e3801.lastDay )/e3801.lastDay *100}%<#else>-</#if> 周 <#if e3801.lastWeek != 0>${(e3801.now-e3801.lastWeek)/e3801.lastWeek*100}%<#else>-</#if>)
访客中注册用户 ${e4001.now?string(',###')}
(日 <#if e4001.lastDay != 0>${(e4001.now-e4001.lastDay )/e4001.lastDay *100}%<#else>-</#if> 周 <#if e4001.lastWeek != 0>${(e4001.now-e4001.lastWeek)/e4001.lastWeek*100}%<#else>-</#if>)
注册-访客占比 ${e4003.now}%
(日 <#if e4003.lastDay != 0>${(e4003.now-e4003.lastDay )/e4003.lastDay *100}%<#else>-</#if> 周 <#if e4003.lastWeek != 0>${(e4003.now-e4003.lastWeek)/e4003.lastWeek*100}%<#else>-</#if>)
访客中当日注册用户 ${e4002.now?string(',###')}
(日 <#if e4002.lastDay != 0>${(e4002.now-e4002.lastDay )/e4002.lastDay *100}%<#else>-</#if> 周 <#if e4002.lastWeek != 0>${(e4002.now-e4002.lastWeek)/e4002.lastWeek*100}%<#else>-</#if>)
当日注册-访客占比 ${e4004.now}%
(日 <#if e4004.lastDay != 0>${(e4004.now-e4004.lastDay )/e4004.lastDay *100}%<#else>-</#if> 周 <#if e4004.lastWeek != 0>${(e4004.now-e4004.lastWeek)/e4004.lastWeek*100}%<#else>-</#if>)
黑金会员访客 ${e3902.now?string(',###')}
(日 <#if e3902.lastDay != 0>${(e3902.now-e3902.lastDay )/e3902.lastDay *100}%<#else>-</#if> 周 <#if e3902.lastWeek != 0>${(e3902.now-e3902.lastWeek)/e3902.lastWeek*100}%<#else>-</#if>)
----------------------------
商城访客 ${e401.now?string(',###')}
(日 <#if e401.lastDay != 0>${(e401.now-e401.lastDay )/e401.lastDay *100}%<#else>-</#if> 周 <#if e401.lastWeek != 0>${(e401.now-e401.lastWeek)/e401.lastWeek*100}%<#else>-</#if>)
商城转化 <#if e101.now != 0>${e401.now/e101.now*100}%<#else>-</#if>
(日 <#if e401.lastDay != 0 && e101.lastDay != 0 && e101.now != 0>${((e401.now/e101.now)-(e401.lastDay /e101.lastDay ))/(e401.lastDay /e101.lastDay )*100}%<#else>-</#if> 周 <#if e401.lastWeek != 0 && e101.lastWeek != 0 && e101.now != 0>${((e401.now/e101.now)-(e401.lastWeek/e101.lastWeek))/(e401.lastWeek/e101.lastWeek)*100}%<#else>-</#if> )
信用管家访客 ${e701.now?string(',###')}
(日 <#if e701.lastDay != 0>${(e701.now-e701.lastDay )/e701.lastDay *100}%<#else>-</#if> 周 <#if e701.lastWeek != 0>${(e701.now-e701.lastWeek)/e701.lastWeek*100}%<#else>-</#if>)
信用管家转化 <#if e101.now != 0>${e701.now/e101.now*100}%<#else>-</#if>
(日 <#if e701.lastDay != 0 && e101.lastDay != 0 && e101.now != 0>${((e701.now/e101.now)-(e701.lastDay /e101.lastDay ))/(e701.lastDay /e101.lastDay )*100}%<#else>-</#if> 周  <#if e701.lastWeek != 0 && e101.lastWeek != 0 && e101.now != 0>${((e701.now/e101.now)-(e701.lastWeek/e101.lastWeek))/(e701.lastWeek/e101.lastWeek)*100}%<#else>-</#if>)
***************************
新访客 ${e201.now?string(',###')}
(日 <#if e201.lastDay != 0>${(e201.now-e201.lastDay )/e201.lastDay *100}%<#else>-</#if> 周 <#if e201.lastWeek != 0>${(e201.now-e201.lastWeek)/e201.lastWeek*100}%<#else>-</#if>)
新访客(除积分墙) ${e3901.now?string(',###')}
(日 <#if e3901.lastDay != 0>${(e3901.now-e3901.lastDay )/e3901.lastDay *100}%<#else>-</#if> 周 <#if e3901.lastWeek != 0>${(e3901.now-e3901.lastWeek)/e3901.lastWeek*100}%<#else>-</#if>)
黑金会员新访客 ${e3903.now?string(',###')}
(日 <#if e3903.lastDay != 0>${(e3903.now-e3903.lastDay )/e3903.lastDay *100}%<#else>-</#if> 周 <#if e3903.lastWeek != 0>${(e3903.now-e3903.lastWeek)/e3903.lastWeek*100}%<#else>-</#if>)
----------------------------
商城新访客 ${e601.now?string(',###')}
(日 <#if e601.lastDay != 0>${(e601.now-e601.lastDay )/e601.lastDay *100}%<#else>-</#if> 周 <#if e601.lastWeek != 0>${(e601.now-e601.lastWeek)/e601.lastWeek*100}%<#else>-</#if>)
商城新访客转化  <#if e201.now != 0>${e601.now/e201.now*100}%<#else>-</#if>
(日 <#if e601.lastDay != 0 && e201.lastDay != 0 && e201.now != 0>${((e601.now/e201.now)-(e601.lastDay /e201.lastDay ))/(e601.lastDay /e201.lastDay )*100}%<#else>-</#if> 周 <#if e601.lastWeek != 0 && e201.lastWeek != 0 && e201.now != 0>${((e601.now/e201.now)-(e601.lastWeek/e201.lastWeek))/(e601.lastWeek/e201.lastWeek)*100}%<#else>-</#if>)
信用管家新访客 ${e801.now?string(',###')}
(日 <#if e801.lastDay != 0>${(e801.now-e801.lastDay )/e801.lastDay *100}%<#else>-</#if> 周 <#if e801.lastWeek != 0>${(e801.now-e801.lastWeek)/e801.lastWeek*100}%<#else>-</#if>)
信用管家新访客转化 <#if e201.now != 0>${e801.now/e201.now*100}%<#else>-</#if>
(日 <#if e801.lastDay != 0 && e201.lastDay != 0 && e201.now != 0>${((e801.now/e201.now)-(e801.lastDay /e201.lastDay ))/(e801.lastDay /e201.lastDay )*100}%<#else>-</#if> 周  <#if e801.lastWeek != 0 && e201.lastWeek != 0 && e201.now != 0>${((e801.now/e201.now)-(e801.lastWeek/e201.lastWeek))/(e801.lastWeek/e201.lastWeek)*100}%<#else>-</#if>)
***************************
老访客 ${(e101.now-e201.now)?string(',###')}
(日 <#if (e101.lastDay -e201.lastDay )  != 0>${((e101.now-e201.now)-(e101.lastDay-e201.lastDay ))/(e101.lastDay-e201.lastDay ) *100}%<#else>-</#if> 周 <#if (e101.lastWeek -e201.lastWeek )  != 0>${((e101.now-e201.now)-(e101.lastWeek-e201.lastWeek ))/(e101.lastWeek-e201.lastWeek ) *100}%<#else>-</#if>)
老访客(除积分墙) ${(e3801.now-e3901.now)?string(',###')}
(日 <#if (e3801.lastDay-e3901.lastDay )  != 0>${((e3801.now-e3901.now)-(e3801.lastDay-e3901.lastDay ))/(e3801.lastDay-e3901.lastDay ) *100}%<#else>-</#if> 周 <#if (e3801.lastWeek-e3901.lastWeek )  != 0>${((e3801.now-e3901.now)-(e3801.lastWeek-e3901.lastWeek ))/(e3801.lastWeek-e3901.lastWeek ) *100}%<#else>-</#if>)
黑金会员老访客 ${(e3902.now-e3903.now)?string(',###')}
(日 <#if (e3902.lastDay -e3903.lastDay )  != 0>${((e3902.now-e3903.now)-(e3902.lastDay -e3903.lastDay ))/(e3902.lastDay -e3903.lastDay ) *100}%<#else>-</#if> 周 <#if (e3902.lastWeek -e3903.lastWeek )  != 0>${((e3902.now-e3903.now)-(e3902.lastWeek -e3903.lastWeek ))/(e3902.lastWeek -e3903.lastWeek ) *100}%<#else>-</#if>)
---------------------------
商城老访客 ${(e401.now-e601.now)?string(',###')}
(日 <#if (e401.lastDay -e601.lastDay )  != 0>${((e401.now-e601.now)-(e401.lastDay -e601.lastDay ))/(e401.lastDay -e601.lastDay ) *100}%<#else>-</#if> 周 <#if (e401.lastWeek -e601.lastWeek )  != 0>${((e401.now-e601.now)-(e401.lastWeek -e601.lastWeek ))/(e401.lastWeek -e601.lastWeek ) *100}%<#else>-</#if>)
商城老访客转化 <#if (e101.now-e201.now) != 0>${(e401.now-e601.now)/(e101.now-e201.now)*100}%<#else>-</#if>
(日 <#if (e101.lastDay -e201.lastDay ) != 0 && (e401.lastDay -e601.lastDay ) != 0 && (e101.now-e201.now) != 0>${((e401.now-e601.now)/(e101.now-e201.now)-(e401.lastDay -e601.lastDay )/(e101.lastDay -e201.lastDay ))/((e401.lastDay -e601.lastDay )/(e101.lastDay -e201.lastDay ))*100}%<#else>-</#if> 周  <#if (e101.lastWeek-e201.lastWeek) != 0 && (e401.lastWeek-e601.lastWeek) != 0 && (e101.now-e201.now) != 0>${((e401.now-e601.now)/(e101.now-e201.now)-(e401.lastWeek-e601.lastWeek)/(e101.lastWeek-e201.lastWeek))/((e401.lastWeek-e601.lastWeek)/(e101.lastWeek-e201.lastWeek))*100}%<#else>-</#if>)
信用管家老访客 ${(e701.now-e801.now)?string(',###')}
(日 <#if (e701.lastDay -e801.lastDay )  != 0>${((e701.now-e801.now)-(e701.lastDay -e801.lastDay ))/(e701.lastDay -e801.lastDay ) *100}%<#else>-</#if> 周 <#if (e701.lastWeek -e801.lastWeek )  != 0>${((e701.now-e801.now)-(e701.lastWeek -e801.lastWeek ))/(e701.lastWeek -e801.lastWeek ) *100}%<#else>-</#if>)
信用管家老访客转化 <#if (e101.now-e201.now) != 0>${(e701.now-e801.now)/(e101.now-e201.now)*100}%<#else>-</#if>
(日 <#if (e101.lastDay -e201.lastDay ) != 0 && (e701.lastDay -e801.lastDay ) != 0 && (e101.now-e201.now) != 0>${((e701.now-e801.now)/(e101.now-e201.now)-(e701.lastDay -e801.lastDay )/(e101.lastDay -e201.lastDay ))/((e701.lastDay -e801.lastDay )/(e101.lastDay -e201.lastDay ))*100}%<#else>-</#if> 周  <#if (e101.lastWeek-e201.lastWeek) != 0 && (e701.lastWeek-e801.lastWeek) != 0 && (e101.now-e201.now) != 0>${((e701.now-e801.now)/(e101.now-e201.now)-(e701.lastWeek-e801.lastWeek)/(e101.lastWeek-e201.lastWeek))/((e701.lastWeek-e801.lastWeek)/(e101.lastWeek-e201.lastWeek))*100}%<#else>-</#if>)
***************************
人均启动次数 <#if e1001.now != 0>${e901.now/e1001.now}<#else>-</#if>
(日 <#if e901.lastDay != 0 && e1001.lastDay != 0 && e1001.now != 0>${((e901.now/e1001.now)-(e901.lastDay /e1001.lastDay ))/(e901.lastDay /e1001.lastDay )*100}%<#else>-</#if> 周 <#if e901.lastWeek != 0 && e1001.lastWeek != 0 && e1001.now != 0>${((e901.now/e1001.now)-(e901.lastWeek/e1001.lastWeek ))/(e901.lastWeek/e1001.lastWeek )*100}%<#else>-</#if> )
安卓-人均启动次数 <#if e1101.now != 0>${e1301.now/e1101.now}<#else>-</#if>
(日 <#if e1301.lastDay != 0 && e1101.lastDay != 0 && e1101.now != 0>${((e1301.now/e1101.now)-(e1301.lastDay /e1101.lastDay ))/(e1301.lastDay /e1101.lastDay )*100}%<#else>-</#if> 周 <#if e1301.lastWeek != 0 && e1101.lastWeek != 0 && e1101.now != 0>${((e1301.now/e1101.now)-(e1301.lastWeek /e1101.lastWeek ))/(e1301.lastWeek /e1101.lastWeek )*100}%<#else>-</#if> )
ios-人均启动次数 <#if e1201.now != 0>${e1401.now/e1201.now}<#else>-</#if>
(日 <#if e1401.lastDay != 0 && e1201.lastDay != 0 && e1201.now != 0>${((e1401.now/e1201.now)-(e1401.lastDay /e1201.lastDay ))/(e1401.lastDay /e1201.lastDay )*100}%<#else>-</#if> 周 <#if e1401.lastWeek != 0 && e1201.lastWeek != 0 && e1201.now != 0>${((e1401.now/e1201.now)-(e1401.lastWeek /e1201.lastWeek ))/(e1401.lastWeek /e1201.lastWeek )*100}%<#else>-</#if> )
---------------------------
平均时长/人 <#if e1001.now != 0 && ((e1501.now/e1001.now/3600) >= 10)>${(e1501.now/e1001.now/3600)?floor}<#else>0${(e1501.now/e1001.now/3600)?floor}</#if>:<#if e1001.now != 0 && ((((e1501.now/e1001.now/3600)-((e1501.now/e1001.now/3600)?floor))*60) >= 10)>${(((e1501.now/e1001.now/3600)-((e1501.now/e1001.now/3600)?floor))*60)?floor}<#else>0${(((e1501.now/e1001.now/3600)-((e1501.now/e1001.now/3600)?floor))*60)?floor}</#if>:<#if e1001.now != 0 && ((((e1501.now/e1001.now/60)-((e1501.now/e1001.now/60)?floor))*60) >= 10)>${(((e1501.now/e1001.now/60)-((e1501.now/e1001.now/60)?floor))*60)?floor}<#else>0${(((e1501.now/e1001.now/60)-((e1501.now/e1001.now/60)?floor))*60)?floor}</#if>
(日 <#if e1501.lastDay != 0 && e1001.lastDay != 0 && e1001.now != 0>${((e1501.now/e1001.now)-(e1501.lastDay /e1001.lastDay ))/(e1501.lastDay /e1001.lastDay )*100}%<#else>-</#if> 周 <#if e1501.lastWeek != 0 && e1001.lastWeek != 0 && e1001.now != 0>${((e1501.now/e1001.now)-(e1501.lastWeek /e1001.lastWeek ))/(e1501.lastWeek /e1001.lastWeek )*100}%<#else>-</#if> )
安卓-平均时长/人 <#if e1101.now != 0 && ((e1601.now/e1101.now/3600) >= 10)>${(e1601.now/e1101.now/3600)?floor}<#else>0${(e1601.now/e1101.now/3600)?floor}</#if>:<#if e1101.now != 0 && ((((e1601.now/e1101.now/3600)-((e1601.now/e1101.now/3600)?floor))*60) >= 10)>${(((e1601.now/e1101.now/3600)-((e1601.now/e1101.now/3600)?floor))*60)?floor}<#else>0${(((e1601.now/e1101.now/3600)-((e1601.now/e1101.now/3600)?floor))*60)?floor}</#if>:<#if e1101.now != 0 && ((((e1601.now/e1101.now/60)-((e1601.now/e1101.now/60)?floor))*60) >= 10)>${(((e1601.now/e1101.now/60)-((e1601.now/e1101.now/60)?floor))*60)?floor}<#else>0${(((e1601.now/e1101.now/60)-((e1601.now/e1101.now/60)?floor))*60)?floor}</#if>
(日 <#if e1601.lastDay != 0 && e1101.lastDay != 0 && e1101.now != 0>${((e1601.now/e1101.now)-(e1601.lastDay /e1101.lastDay ))/(e1601.lastDay /e1101.lastDay )*100}%<#else>-</#if> 周 <#if e1601.lastWeek != 0 && e1101.lastWeek != 0 && e1101.now != 0>${((e1601.now/e1101.now)-(e1601.lastWeek /e1101.lastWeek ))/(e1601.lastWeek /e1101.lastWeek )*100}%<#else>-</#if> )
ios-平均时长/人  <#if e1201.now != 0 && ((e1701.now/e1201.now/3600) >= 10)>${(e1701.now/e1201.now/3600)?floor}<#else>0${(e1701.now/e1201.now/3600)?floor}</#if>:<#if e1201.now != 0 && ((((e1701.now/e1201.now/3600)-((e1701.now/e1201.now/3600)?floor))*60) >= 10)>${(((e1701.now/e1201.now/3600)-((e1701.now/e1201.now/3600)?floor))*60)?floor}<#else>0${(((e1701.now/e1201.now/3600)-((e1701.now/e1201.now/3600)?floor))*60)?floor}</#if>:<#if e1201.now != 0 && ((((e1701.now/e1201.now/60)-((e1701.now/e1201.now/60)?floor))*60) >= 10)>${(((e1701.now/e1201.now/60)-((e1701.now/e1201.now/60)?floor))*60)?floor}<#else>0${(((e1701.now/e1201.now/60)-((e1701.now/e1201.now/60)?floor))*60)?floor}</#if>
(日 <#if e1701.lastDay != 0 && e1201.lastDay != 0 && e1201.now != 0>${((e1701.now/e1201.now)-(e1701.lastDay /e1201.lastDay ))/(e1701.lastDay /e1201.lastDay )*100}%<#else>-</#if> 周 <#if e1701.lastWeek != 0 && e1201.lastWeek != 0 && e1201.now != 0>${((e1701.now/e1201.now)-(e1701.lastWeek /e1201.lastWeek ))/(e1701.lastWeek /e1201.lastWeek )*100}%<#else>-</#if> )
---------------------------
新访客次日留存 <#if e1901.now != 0>${e1801.now/e1901.now*100}%<#else>-</#if>
(日 <#if e1801.lastDay != 0 && e1901.lastDay != 0 && e1901.now != 0>${((e1801.now/e1901.now)-(e1801.lastDay /e1901.lastDay ))/(e1801.lastDay /e1901.lastDay )*100}%<#else>-</#if> 周 <#if e1801.lastWeek != 0 && e1901.lastWeek != 0 && e1901.now != 0>${((e1801.now/e1901.now)-(e1801.lastWeek /e1901.lastWeek ))/(e1801.lastWeek /e1901.lastWeek )*100}%<#else>-</#if> )
安卓-新访客次日留存 <#if e2201.now != 0>${e2001.now/e2201.now*100}%<#else>-</#if>
(日 <#if e2001.lastDay != 0 && e2201.lastDay != 0 && e2201.now != 0>${((e2001.now/e2201.now)-(e2001.lastDay /e2201.lastDay ))/(e2001.lastDay /e2201.lastDay )*100}%<#else>-</#if> 周 <#if e2001.lastWeek != 0 && e2201.lastWeek != 0 && e2201.now != 0>${((e2001.now/e2201.now)-(e2001.lastWeek /e2201.lastWeek ))/(e2001.lastWeek /e2201.lastWeek )*100}%<#else>-</#if> )
ios-新访客次日留存 <#if e2301.now != 0>${e2101.now/e2301.now*100}%<#else>-</#if>
(日 <#if e2101.lastDay != 0 && e2301.lastDay != 0 && e2301.now != 0>${((e2101.now/e2301.now)-(e2101.lastDay /e2301.lastDay ))/(e2101.lastDay /e2301.lastDay )*100}%<#else>-</#if> 周 <#if e2101.lastWeek != 0 && e2301.lastWeek != 0 && e2301.now != 0>${((e2101.now/e2301.now)-(e2101.lastWeek /e2301.lastWeek ))/(e2101.lastWeek /e2301.lastWeek )*100}%<#else>-</#if> )
---------------------------
新访客7日留存率 <#if e2501.now != 0>${e2401.now/e2501.now*100}%<#else>-</#if>
(日 <#if e2401.lastDay != 0 && e2501.lastDay != 0 && e2501.now != 0>${((e2401.now/e2501.now)-(e2401.lastDay /e2501.lastDay ))/(e2401.lastDay /e2501.lastDay )*100}%<#else>-</#if> 周 <#if e2401.lastWeek != 0 && e2501.lastWeek != 0 && e2501.now != 0>${((e2401.now/e2501.now)-(e2401.lastWeek /e2501.lastWeek ))/(e2401.lastWeek /e2501.lastWeek )*100}%<#else>-</#if> )
安卓-新访客7日留存 <#if e2801.now != 0>${e2601.now/e2801.now*100}%<#else>-</#if>
(日 <#if e2601.lastDay != 0 && e2801.lastDay != 0 && e2801.now != 0>${((e2601.now/e2801.now)-(e2601.lastDay /e2801.lastDay ))/(e2601.lastDay /e2801.lastDay )*100}%<#else>-</#if> 周 <#if e2601.lastWeek != 0 && e2801.lastWeek != 0 && e2801.now != 0>${((e2601.now/e2801.now)-(e2601.lastWeek/e2801.lastWeek))/(e2601.lastWeek/e2801.lastWeek)*100}%<#else>-</#if> )
ios-新访客7日留存 <#if e2901.now != 0>${e2701.now/e2901.now*100}%<#else>-</#if>
(日 <#if e2701.lastDay != 0 && e2901.lastDay != 0 && e2901.now != 0>${((e2701.now/e2901.now)-(e2701.lastDay /e2901.lastDay ))/(e2701.lastDay /e2901.lastDay )*100}%<#else>-</#if> 周 <#if e2701.lastWeek != 0 && e2901.lastWeek != 0 && e2901.now != 0>${((e2701.now/e2901.now)-(e2701.lastWeek /e2901.lastWeek ))/(e2701.lastWeek /e2901.lastWeek )*100}%<#else>-</#if> )
---------------------------
MAU ${e4005.now?string(',###')}
(日 <#if e4005.lastDay != 0>${(e4005.now-e4005.lastDay )/e4005.lastDay *100}%<#else>-</#if> 周 <#if e4005.lastWeek != 0>${(e4005.now-e4005.lastWeek)/e4005.lastWeek*100}%<#else>-</#if>)
日活跃度 ${e4006.now}%
(日 <#if e4006.lastDay != 0>${(e4006.now-e4006.lastDay )/e4006.lastDay *100}%<#else>-</#if> 周 <#if e4006.lastWeek != 0>${(e4006.now-e4006.lastWeek)/e4006.lastWeek*100}%<#else>-</#if>)
***************************