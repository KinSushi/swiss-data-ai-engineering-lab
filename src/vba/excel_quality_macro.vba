Sub CountNegativeAmounts()
    Dim Amounts As Variant
    Amounts = Array(125.5, -25, 900, 42)
    Dim Count As Integer
    Count = 0
    For Each Amount In Amounts
        If Amount < 0 Then Count = Count + 1
    Next Amount
    MsgBox "Negative amounts: " & Count
End Sub
