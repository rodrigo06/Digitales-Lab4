`timescale 1 ns/1 ns
module pixB_tb;

parameter totpix=307200;
integer indxpix;
integer indypix;
integer indpix;
logic write_en;
logic clk;
logic [7:0] val_inpix;
logic inijuego;
integer campo;
integer jugador;
wire [7:0] pix_val;



//RAM_IN ram_in(pix_val, indx, clk, write_en, val_in,addr);
//RAM_IN ram_in(totpix, indpix, clk, pix_val);
pixB #(totpix) prupixb (indxpix,indypix,indpix,write_en,clk,val_inpix, inijuego, campo, jugador , pix_val);




initial
begin
clk=0;
	#10;
	for (indypix=0; indypix<480; indypix=indypix+1)
		begin 
			for (indxpix=0; indxpix<640; indxpix=indxpix+1)
				begin
					if (indxpix==700  && indypix==500)  //posicion del pixel que se escribira
						begin
							write_en=1'b1;
							val_inpix='{0,0,1,1,0,0,0,0};
							#20;  // wait for 20 clock cycle
						end
					else
						begin
							campo=1;
							jugador=2;
							inijuego=1'b0;
							write_en=1'b0;
							indpix=(indxpix)+(indypix*480); //480 valor horizontal del
							#20;  // wait for 20 clock cycle
						end
				end
			#20;  // wait for 20 clock cycle
      end
	#20;	
end
always
	#10 clk=~clk;
endmodule