module pixB #(parameter totpix=1) (indxpix,indypix,indpix,write_en,clk,val_inpix, inijuego, campo, jugador , pix_val);


input int indxpix; // posicion x del pixel 
input int indypix; // posicion y del pixel 
input int indpix;	 // numero del pixel
input logic write_en; //parametro para saber si se hara escritura (1) o lectura (0)
input logic clk; //Clock para mantener la sincronizacion
input logic [7:0] val_inpix; // valores del pixel, que se usaran para escribir

input logic inijuego;	//inicializacion juego 
input int campo;	 // numero del campo del juego, basados en cuadricula
input int jugador; //numero jugador


output logic [7:0] pix_val; // los 8 bits que corresponde al valor del bit


reg [7:0] tablero [0:totpix-1];  // utilizado para almacenar todos los pixeles del tablero
reg [7:0] gokuB [0:64-1];  // utilizado para almacenar todos los pixeles 64x64=4096
reg [7:0] freezerB [0:64-1];  // utilizado para almacenar todos los pixeles 64x64=4096
//int indpix=(indxpix)+(indypix*13) ********************************************duda***********************************

initial
	begin
		$readmemb("C:/intelFPGA_lite/18.1/prueblab4/tableroB.txt", tablero);// almacenamiento de todos los pixeles en memoria
		$readmemb("C:/intelFPGA_lite/18.1/prueblab4/gokuB.txt", gokuB);
		$readmemb("C:/intelFPGA_lite/18.1/prueblab4/freezerB.txt", freezerB);
	end

always @(posedge clk)
	begin
	
	if (write_en) // se verifica si se hara escritura o  no
		begin
			tablero[indpix] = val_inpix;   // asignacion del pixel que se quiere escribir
			pix_val = tablero[indpix];     //salida en base al pixel escrito y solicitado
		end
	else
		begin
			case(inijuego)  // se verifica si es carga inicial del juego
				1:pix_val = tablero[indpix]; //se carga el pixel en base al indice solicitado
			default:
				begin
					case(campo)  // se verifica que parte de la cuadricula en base al juego se quiere carga
					1:begin
						case(73<=indxpix && indxpix<137  && 46<=indypix && indypix<110 ) // se verifica las posiciones de la cadricula 1
						1'b1:begin	
									case(jugador) // se verifica si se quiera cargar un sprite en la cuadricula, en base al jugador
										1:pix_val=gokuB[(indxpix-73)+((indypix-46)*64)]; // se cargar el # pixel asociado al sprite del jugador 1
										default:pix_val=freezerB[(indxpix-73)+((indypix-46)*64)]; // se cargar el # pixel asociado al sprite del jugador 2
									endcase
								end
					    1'b0:pix_val=tablero[indpix]; // se carga el pixel del tablero, ya que no corresponde a posicion del pixel en donde se ubicaria el sprite
						endcase
					  end
					2:begin
					   case(288<=indxpix && indxpix<352  && 46<=indypix && indypix<110 ) // se verifica las posiciones de la cadricula 2
						1'b1:begin
									case(jugador) //se verifica si se quiera cargar un sprite en la cuadricula, en base al jugador
										1:pix_val=gokuB[(indxpix-288)+((indypix-46)*64)]; // se cargar el # pixel asociado al sprite del jugador 1
										default:pix_val=freezerB[(indxpix-288)+((indypix-46)*64)]; // se cargar el # pixel asociado al sprite del jugador 2
									endcase
								end
						1'b0:pix_val=tablero[indpix]; // se carga el pixel del tablero, ya que no corresponde a posicion del pixel en donde se ubicaria el sprite
					   endcase
					  end
					3:begin
						case(503<=indxpix && indxpix<567  && 46<=indypix && indypix<110 ) // se verifica las posiciones de la cadricula 3
						1'b1:begin
									case(jugador) //se verifica si se quiera cargar un sprite en la cuadricula, en base al jugador
										1:pix_val=gokuB[(indxpix-503)+((indypix-46)*64)]; // se cargar el # pixel asociado al sprite del jugador 1
										default:pix_val=freezerB[(indxpix-503)+((indypix-46)*64)]; // se cargar el # pixel asociado al sprite del jugador 2
									endcase
								end
						1'b0:pix_val=tablero[indpix]; // se carga el pixel del tablero, ya que no corresponde a posicion del pixel en donde se ubicaria el sprite
						endcase
					end
					4:begin
						case(73<=indxpix && indxpix<137  && 207<=indypix && indypix<271 ) // se verifica las posiciones de la cadricula 4
						1'b1:begin
									case(jugador) //se verifica si se quiera cargar un sprite en la cuadricula, en base al jugador
										1:pix_val=gokuB[(indxpix-73)+((indypix-207)*64)]; // se cargar el # pixel asociado al sprite del jugador 1
										default:pix_val=freezerB[(indxpix-73)+((indypix-207)*64)]; // se cargar el # pixel asociado al sprite del jugador 2
									endcase 
								end
						1'b0:pix_val=tablero[indpix]; // se carga el pixel del tablero, ya que no corresponde a posicion del pixel en donde se ubicaria el sprite
						endcase
					 end
					5:begin
						case(288<=indxpix && indxpix<352  && 207<=indypix && indypix<271 ) // se verifica las posiciones de la cadricula 5
						1'b1:begin
									case(jugador) //se verifica si se quiera cargar un sprite en la cuadricula, en base al jugador
										1:pix_val=gokuB[(indxpix-288)+((indypix-207)*64)]; // se cargar el # pixel asociado al sprite del jugador 1
										default:pix_val=freezerB[(indxpix-288)+((indypix-207)*64)]; // se cargar el # pixel asociado al sprite del jugador 2
									endcase
								end
						1'b0:pix_val=tablero[indpix]; // se carga el pixel del tablero, ya que no corresponde a posicion del pixel en donde se ubicaria el sprite
						endcase
					 end
					6:begin
						case(503<=indxpix && indxpix<567  && 207<=indypix && indypix<6 ) // se verifica las posiciones de la cadricula 6
						1'b1:begin
									case(jugador) //se verifica si se quiera cargar un sprite en la cuadricula, en base al jugador
										1:pix_val=gokuB[(indxpix-503)+((indypix-207)*64)]; // se cargar el # pixel asociado al sprite del jugador 1
										default:pix_val=freezerB[(indxpix-503)+((indypix-207)*64)]; // se cargar el # pixel asociado al sprite del jugador 2
									endcase
								end
						1'b0:pix_val=tablero[indpix]; // se carga el pixel del tablero, ya que no corresponde a posicion del pixel en donde se ubicaria el sprite
						endcase
					 end
					7:begin
						case(73<=indxpix && indxpix<137  && 368<=indypix && indypix<432 ) // se verifica las posiciones de la cadricula 7
						1'b1:begin
									case(jugador) //se verifica si se quiera cargar un sprite en la cuadricula, en base al jugador
										1:pix_val=gokuB[(indxpix-73)+((indypix-368)*64)]; // se cargar el # pixel asociado al sprite del jugador 1
										default:pix_val=freezerB[(indxpix-73)+((indypix-368)*64)]; // se cargar el # pixel asociado al sprite del jugador 2
									endcase
								end
						1'b0:pix_val=tablero[indpix]; // se carga el pixel del tablero, ya que no corresponde a posicion del pixel en donde se ubicaria el sprite
						endcase
					 end
					8:begin
						case(288<=indxpix && indxpix<352  && 368<=indypix && indypix<432 ) // se verifica las posiciones de la cadricula 8
						1'b1:begin
									case(jugador) //se verifica si se quiera cargar un sprite en la cuadricula, en base al jugador
										1:pix_val=gokuB[(indxpix-288)+((indypix-368)*64)]; // se cargar el # pixel asociado al sprite del jugador 1
										default:pix_val=freezerB[(indxpix-288)+((indypix-368)*64)]; // se cargar el # pixel asociado al sprite del jugador 2
									endcase
								end
						1'b0:pix_val=tablero[indpix];// se carga el pixel del tablero, ya que no corresponde a posicion del pixel en donde se ubicaria el sprite
						endcase
					 end
					default:begin
								case(503<=indxpix && indxpix<567  && 368<=indypix && indypix<432 ) // se verifica las posiciones de la cadricula 9
								1'b1:begin
											case(jugador) //se verifica si se quiera cargar un sprite en la cuadricula, en base al jugador
												1:pix_val=gokuB[(indxpix-503)+((indypix-368)*64)]; // se cargar el # pixel asociado al sprite del jugador 1
												default:pix_val=freezerB[(indxpix-503)+((indypix-368)*64)]; // se cargar el # pixel asociado al sprite del jugador 2
											endcase
										end
								1'b0:pix_val=tablero[indpix];// se carga el pixel del tablero, ya que no corresponde a posicion del pixel en donde se ubicaria el sprite
								endcase
							 end
							 
					endcase
				end
			endcase
		end
	end
endmodule






