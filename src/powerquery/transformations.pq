let
    Source = Csv.Document(File.Contents("transactions.csv"), [Delimiter=",", Columns=9, Encoding=65001, QuoteStyle=QuoteStyle.Csv]),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {{"amount", type number}, {"currency", type text}})
in
    ChangedTypes
