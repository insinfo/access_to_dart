// Selective static probe: no whole-program analysis, no target execution.
import ghidra.app.script.GhidraScript;
import ghidra.app.cmd.disassemble.DisassembleCommand;
import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileResults;
import ghidra.program.model.address.Address;
import ghidra.program.model.address.AddressSet;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.Instruction;
import ghidra.program.model.listing.InstructionIterator;
import java.io.PrintWriter;

public class AccessCatalogProbe extends GhidraScript {
  public void run() throws Exception {
    if (!"2368c960d2b70cb51b54c12c27b47f106c55d377ece75ef55c0a988a481ad00f".equalsIgnoreCase(currentProgram.getExecutableSHA256())) {
      throw new IllegalArgumentException("Different binary: derive new ranges; do not reuse these RVAs");
    }
    if (getScriptArgs().length != 1) throw new IllegalArgumentException("Expected output path");
    try(PrintWriter out = new PrintWriter(getScriptArgs()[0])) {
      out.println("Program="+currentProgram.getName()+" imageBase="+currentProgram.getImageBase());
      long[][] ranges={{0x442ccL,0x44352L},{0x8ec2e8L,0x8ec4feL},{0x12ae44L,0x12af47L}};
      for (long[] range:ranges) {
        Address start=toAddr(0x140000000L+range[0]);
        Address end=toAddr(0x140000000L+range[1]-1);
        AddressSet set=new AddressSet(start,end);
        new DisassembleCommand(start,set,true).applyTo(currentProgram,monitor);
        Function f=getFunctionAt(start);
        if(f==null)f=createFunction(start,"access_probe_"+Long.toHexString(range[0]));
        out.println("\nRVA="+Long.toHexString(range[0]));
        InstructionIterator it=currentProgram.getListing().getInstructions(set,true);
        while(it.hasNext()) {
          Instruction ins=it.next();out.println(ins.getAddress()+" "+ins);
        }
        if(f!=null){
          f.setBody(set);
          DecompInterface dec=new DecompInterface();
          try{dec.openProgram(currentProgram);DecompileResults r=dec.decompileFunction(f,20,monitor);
            out.println(r.decompileCompleted()?r.getDecompiledFunction().getC():r.getErrorMessage());
          }finally{dec.dispose();}
        }
      }
    }
  }
}
