import mill._, scalalib._

object smoke extends ScalaModule {
  def scalaVersion = "2.13.12"

  def ivyDeps = Agg(
    ivy"org.chipsalliance::chisel:6.7.0",
  )

  def scalacPluginIvyDeps = Agg(
    ivy"org.chipsalliance:::chisel-plugin:6.7.0",
  )
}
