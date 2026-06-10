object Average extends App {
  val amounts = Seq(125.5, -25.0, 900.0, 42.0)
  val average = amounts.sum / amounts.length
  val negativeAmounts = amounts.count(_ < 0)
  println(s"average=$average negative_amounts=$negativeAmounts")
}
