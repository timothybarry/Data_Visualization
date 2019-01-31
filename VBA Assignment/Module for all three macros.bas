Attribute VB_Name = "Module1"
Sub VolumeTracker()


Dim I As Integer
Dim Volume As Double
Dim WS_Count As Integer
Dim ticker As String

        ' Set WS_Count equal to the number of worksheets in the active
        ' workbook.
         WS_Count = ActiveWorkbook.Worksheets.Count
        'Cells(1, 1).Value = "ticker"
        'MsgBox WS_Count
         

         ' Begin the loop.
         For I = 1 To WS_Count
         
            Volume = 0
            'define last row for current worksheet
            'LastRow = ws.Cells(Rows.Count, 7).End(xlDown).Row
            
            ' Insert your code here.
            With ThisWorkbook.Worksheets(I)
                'compare the different string values for tickers
                'if cells(1,1) <> cells(i,1)
                lastrow = .Range("G2").End(xlDown).Row
                'MsgBox LastRow
                'MsgBox "G2:G" & LastRow
                
                Volume = Application.WorksheetFunction.Sum(Range("G2:G" & lastrow))
                MsgBox ("Sheet " & ActiveWorkbook.Worksheets(I).Name + " Yearly Volume is " & Volume)
            End With
            
            
            ' The following line shows how to reference a sheet within
            ' the loop by displaying the worksheet name in a dialog box
            
            
            
            
         Next I




End Sub



Sub ticker()



 'create Header/Title for the total volume column
        Cells(1, 9).Value = "Ticker"

   'find last row in the sheet
       Dim lastrow As Double
       lastrow = Cells(Rows.Count, 1).End(xlUp).Row
       
       'declare variables
       
       Dim ticker As String
       Dim a As Double
       a = 2
       
           For I = 2 To lastrow


                       If Cells(I, 1).Value <> Cells(I + 1, 1).Value Then

                           ticker = Cells(I, 1).Value
                           Cells(a, 9).Value = ticker
                           a = a + 1



                       End If



           Next I



End Sub



Sub Total_Volume()



  'header for total volume column
  
        Cells(1, 10).Value = "Total Volume"



   'declare variables and set initial value
       Dim running_total As Double
       Dim total As Double
       total = 0
       running_total = 0
       
       Dim b As Double
       b = 2
       
       

   'finds the last row in the sheet
   
       Dim lastrow As Double
       lastrow = Cells(Rows.Count, 1).End(xlUp).Row
       
       

   'create loop that totals the volume for each different ticket


       For I = 2 To lastrow

               total = Cells(I, 7).Value
               running_total = running_total + total

                       If Cells(I, 1).Value <> Cells(I + 1, 1).Value Then

                               Cells(b, 10).Value = running_total
                               b = b + 1
                               running_total = 0
                               total = 0

                       End If



       Next I




End Sub
