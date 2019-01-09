'宏作用：将每行的内容自动识别制表，生成工作周报与邮件内容

Sub Generate_WorkReport()
    Dim FirstDay$, LastDay$, NewReportName$, StartCell as Range
    LastDay = Format(Date, "mmdd")
    FirstDay = Format(Date - 6, "mmdd") 
    
    Set StartCell = Sheet("Temp").[A:A].Find(What:="start")
    If StartCell is Nothing Then
        MsgBox "没找到启动标志：start！"
        Exit Sub
    End if
        
'【TODO】格式处理：自动调整格式，比如说全边框，粗体自动变颜色，自动生成首列时间等，未完成的，正在进行中的进行标注

'【TODO】生成图表：根据时间比例自动分配图表

'【TODO】生成文件：在新建一个临时xlsx文件，并将当前表复制到其中，保持列宽，填充色等不变

'【TODO】生成概要：生成工作周报总结，方便放置到邮件正文中

'【TODO】设置邮件：自动设置邮件收件人，抄送人，邮件主题，设置附件

'【TODO】收尾工作：删除临时xlsx工作表
  ThisWorkbook.save
    
  NewReportName = "【WorkReport】" & FirstDay & "-" & LastDay & "-ZKM.xlsx"
  Sheets("Temp").Copy
  ChDir "C:\Users\JokeComing\Desktop"
  ActiveWorkbook.SaveAs Filename:="C:\Users\JokeComing\Desktop\" & NewReportName, _
      FileFormat:=xlOpenXMLWorkbook, CreateBackup:=False
  Windows("【WorkReport】2019.xlsm").Activate
  Msgbox "已经生成工作周报！"

End Sub
