package opentaalas

import chisel3._
import circt.stage.ChiselStage

class SmokeAdder extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(8.W))
    val b = Input(UInt(8.W))
    val sum = Output(UInt(9.W))
  })
  io.sum := io.a +& io.b
}

object SmokeAdderGen extends App {
  val outputDir = sys.env.getOrElse("GENERATED_DIR",
    new java.io.File("../../rtl/generated").getCanonicalPath)
  new java.io.File(outputDir).mkdirs()

  ChiselStage.emitSystemVerilogFile(
    new SmokeAdder,
    args = Array("--target-dir", outputDir),
    firtoolOpts = Array("-disable-all-randomization", "-strip-debug-info")
  )
}
