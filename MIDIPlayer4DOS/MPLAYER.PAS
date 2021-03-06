program MPlayer4DOS_Created_By_WobbyChip;

uses MIDIDrv, crt, dos;

const TrackSize=1873;
      TrackData:array[1..TrackSize] of byte=(
	$4D, $54, $68, $64, $00, $00, $00, $06, $00, $01, $00, $08, $00, $60, $4D, $54, 
	$72, $6B, $00, $00, $00, $0C, $00, $FF, $58, $04, $04, $02, $18, $08, $00, $FF, 
	$2F, $00, $4D, $54, $72, $6B, $00, $00, $00, $0B, $00, $FF, $51, $03, $06, $8A, 
	$1B, $00, $FF, $2F, $00, $4D, $54, $72, $6B, $00, $00, $00, $C2, $00, $FF, $03, 
	$0B, $4B, $69, $63, $6B, $20, $28, $4D, $49, $44, $49, $29, $00, $B0, $0A, $40, 
	$00, $B0, $07, $64, $00, $E0, $00, $40, $00, $B0, $65, $00, $00, $B0, $64, $00, 
	$00, $B0, $06, $0C, $00, $B0, $0A, $40, $00, $B0, $07, $64, $00, $E0, $00, $40, 
	$00, $C0, $00, $00, $B0, $65, $00, $00, $B0, $64, $00, $00, $B0, $06, $0C, $00, 
	$B0, $0A, $40, $00, $B0, $07, $64, $00, $E0, $00, $40, $00, $C0, $00, $00, $B0, 
	$65, $00, $00, $B0, $64, $00, $00, $B0, $06, $0C, $00, $B0, $0A, $40, $00, $B0, 
	$07, $64, $00, $E0, $00, $40, $00, $C0, $00, $98, $00, $B0, $65, $00, $00, $B0, 
	$64, $00, $00, $B0, $06, $0C, $00, $B0, $0A, $40, $00, $B0, $07, $64, $00, $E0, 
	$00, $40, $00, $C0, $00, $02, $B0, $65, $00, $00, $B0, $64, $00, $00, $B0, $06, 
	$0C, $00, $B0, $0A, $40, $00, $B0, $07, $64, $00, $E0, $00, $40, $00, $C0, $00, 
	$00, $B0, $65, $00, $00, $B0, $64, $00, $00, $B0, $06, $0C, $00, $B0, $0A, $40, 
	$00, $B0, $07, $64, $00, $E0, $00, $40, $00, $C0, $00, $00, $FF, $2F, $00, $4D, 
	$54, $72, $6B, $00, $00, $00, $C2, $00, $FF, $03, $0B, $43, $6C, $61, $70, $20, 
	$28, $4D, $49, $44, $49, $29, $00, $B1, $0A, $40, $00, $B1, $07, $64, $00, $E1, 
	$00, $40, $00, $B1, $65, $00, $00, $B1, $64, $00, $00, $B1, $06, $0C, $00, $B1, 
	$0A, $40, $00, $B1, $07, $64, $00, $E1, $00, $40, $00, $C1, $00, $00, $B1, $65, 
	$00, $00, $B1, $64, $00, $00, $B1, $06, $0C, $00, $B1, $0A, $40, $00, $B1, $07, 
	$64, $00, $E1, $00, $40, $00, $C1, $00, $00, $B1, $65, $00, $00, $B1, $64, $00, 
	$00, $B1, $06, $0C, $00, $B1, $0A, $40, $00, $B1, $07, $64, $00, $E1, $00, $40, 
	$00, $C1, $00, $98, $00, $B1, $65, $00, $00, $B1, $64, $00, $00, $B1, $06, $0C, 
	$00, $B1, $0A, $40, $00, $B1, $07, $64, $00, $E1, $00, $40, $00, $C1, $00, $02, 
	$B1, $65, $00, $00, $B1, $64, $00, $00, $B1, $06, $0C, $00, $B1, $0A, $40, $00, 
	$B1, $07, $64, $00, $E1, $00, $40, $00, $C1, $00, $00, $B1, $65, $00, $00, $B1, 
	$64, $00, $00, $B1, $06, $0C, $00, $B1, $0A, $40, $00, $B1, $07, $64, $00, $E1, 
	$00, $40, $00, $C1, $00, $00, $FF, $2F, $00, $4D, $54, $72, $6B, $00, $00, $00, 
	$C1, $00, $FF, $03, $0A, $48, $61, $74, $20, $28, $4D, $49, $44, $49, $29, $00, 
	$B2, $0A, $40, $00, $B2, $07, $64, $00, $E2, $00, $40, $00, $B2, $65, $00, $00, 
	$B2, $64, $00, $00, $B2, $06, $0C, $00, $B2, $0A, $40, $00, $B2, $07, $64, $00, 
	$E2, $00, $40, $00, $C2, $00, $00, $B2, $65, $00, $00, $B2, $64, $00, $00, $B2, 
	$06, $0C, $00, $B2, $0A, $40, $00, $B2, $07, $64, $00, $E2, $00, $40, $00, $C2, 
	$00, $00, $B2, $65, $00, $00, $B2, $64, $00, $00, $B2, $06, $0C, $00, $B2, $0A, 
	$40, $00, $B2, $07, $64, $00, $E2, $00, $40, $00, $C2, $00, $98, $00, $B2, $65, 
	$00, $00, $B2, $64, $00, $00, $B2, $06, $0C, $00, $B2, $0A, $40, $00, $B2, $07, 
	$64, $00, $E2, $00, $40, $00, $C2, $00, $02, $B2, $65, $00, $00, $B2, $64, $00, 
	$00, $B2, $06, $0C, $00, $B2, $0A, $40, $00, $B2, $07, $64, $00, $E2, $00, $40, 
	$00, $C2, $00, $00, $B2, $65, $00, $00, $B2, $64, $00, $00, $B2, $06, $0C, $00, 
	$B2, $0A, $40, $00, $B2, $07, $64, $00, $E2, $00, $40, $00, $C2, $00, $00, $FF, 
	$2F, $00, $4D, $54, $72, $6B, $00, $00, $00, $B1, $00, $FF, $03, $0C, $53, $6E, 
	$61, $72, $65, $20, $28, $4D, $49, $44, $49, $29, $00, $B9, $0A, $40, $00, $B9, 
	$07, $64, $00, $E9, $00, $40, $00, $B9, $65, $00, $00, $B9, $64, $00, $00, $B9, 
	$06, $0C, $00, $B9, $0A, $40, $00, $B9, $07, $64, $00, $E9, $00, $40, $00, $B9, 
	$65, $00, $00, $B9, $64, $00, $00, $B9, $06, $0C, $00, $B9, $0A, $40, $00, $B9, 
	$07, $64, $00, $E9, $00, $40, $00, $B9, $65, $00, $00, $B9, $64, $00, $00, $B9, 
	$06, $0C, $00, $B9, $0A, $40, $00, $B9, $07, $64, $00, $E9, $00, $40, $98, $00, 
	$B9, $65, $00, $00, $B9, $64, $00, $00, $B9, $06, $0C, $00, $B9, $0A, $40, $00, 
	$B9, $07, $64, $00, $E9, $00, $40, $02, $B9, $65, $00, $00, $B9, $64, $00, $00, 
	$B9, $06, $0C, $00, $B9, $0A, $40, $00, $B9, $07, $64, $00, $E9, $00, $40, $00, 
	$B9, $65, $00, $00, $B9, $64, $00, $00, $B9, $06, $0C, $00, $B9, $0A, $40, $00, 
	$B9, $07, $64, $00, $E9, $00, $40, $00, $FF, $2F, $00, $4D, $54, $72, $6B, $00, 
	$00, $01, $C4, $00, $FF, $03, $0E, $42, $6F, $6F, $42, $61, $73, $73, $20, $28, 
	$4D, $49, $44, $49, $29, $00, $B4, $0A, $40, $00, $B4, $07, $64, $00, $E4, $00, 
	$40, $00, $B4, $65, $00, $00, $B4, $64, $00, $00, $B4, $06, $0C, $00, $B4, $0A, 
	$40, $00, $B4, $07, $64, $00, $E4, $00, $40, $00, $C4, $26, $00, $B4, $65, $00, 
	$00, $B4, $64, $00, $00, $B4, $06, $0C, $00, $B4, $0A, $40, $00, $B4, $07, $64, 
	$00, $E4, $00, $40, $00, $C4, $26, $00, $B4, $65, $00, $00, $B4, $64, $00, $00, 
	$B4, $06, $0C, $00, $B4, $0A, $40, $00, $B4, $07, $64, $00, $E4, $00, $40, $00, 
	$C4, $26, $00, $94, $3E, $64, $30, $84, $3E, $40, $30, $94, $3E, $64, $30, $84, 
	$3E, $40, $30, $94, $3E, $64, $30, $84, $3E, $40, $30, $94, $3E, $64, $30, $84, 
	$3E, $40, $30, $94, $3A, $64, $30, $84, $3A, $40, $30, $94, $3A, $64, $30, $84, 
	$3A, $40, $30, $94, $3A, $64, $30, $84, $3A, $40, $30, $94, $3A, $64, $30, $84, 
	$3A, $40, $30, $94, $35, $64, $30, $84, $35, $40, $30, $94, $35, $64, $30, $84, 
	$35, $40, $30, $94, $35, $64, $30, $84, $35, $40, $30, $94, $35, $64, $30, $84, 
	$35, $40, $30, $94, $40, $64, $30, $84, $40, $40, $30, $94, $40, $64, $30, $84, 
	$40, $40, $30, $94, $40, $64, $30, $84, $40, $40, $30, $94, $40, $64, $30, $84, 
	$40, $40, $30, $94, $3E, $64, $30, $84, $3E, $40, $30, $94, $3E, $64, $30, $84, 
	$3E, $40, $30, $94, $3E, $64, $30, $84, $3E, $40, $30, $94, $3E, $64, $30, $84, 
	$3E, $40, $30, $94, $3A, $64, $30, $84, $3A, $40, $30, $94, $3A, $64, $30, $84, 
	$3A, $40, $30, $94, $3A, $64, $30, $84, $3A, $40, $30, $94, $3A, $64, $30, $84, 
	$3A, $40, $30, $94, $35, $64, $30, $84, $35, $40, $30, $94, $35, $64, $30, $84, 
	$35, $40, $30, $94, $35, $64, $30, $84, $35, $40, $30, $94, $35, $64, $30, $84, 
	$35, $40, $30, $94, $40, $64, $30, $84, $40, $40, $30, $94, $40, $64, $30, $84, 
	$40, $40, $30, $94, $40, $64, $30, $84, $40, $40, $30, $94, $40, $64, $30, $84, 
	$40, $40, $30, $B4, $65, $00, $00, $B4, $64, $00, $00, $B4, $06, $0C, $00, $B4, 
	$0A, $40, $00, $B4, $07, $64, $00, $E4, $00, $40, $00, $C4, $26, $02, $B4, $65, 
	$00, $00, $B4, $64, $00, $00, $B4, $06, $0C, $00, $B4, $0A, $40, $00, $B4, $07, 
	$64, $00, $E4, $00, $40, $00, $C4, $26, $00, $B4, $65, $00, $00, $B4, $64, $00, 
	$00, $B4, $06, $0C, $00, $B4, $0A, $40, $00, $B4, $07, $64, $00, $E4, $00, $40, 
	$00, $C4, $26, $00, $FF, $2F, $00, $4D, $54, $72, $6B, $00, $00, $02, $32, $00, 
	$FF, $03, $0C, $47, $61, $6D, $65, $72, $20, $28, $4D, $49, $44, $49, $29, $00, 
	$B5, $0A, $40, $00, $B5, $07, $64, $00, $E5, $00, $40, $00, $B5, $65, $00, $00, 
	$B5, $64, $00, $00, $B5, $06, $0C, $00, $B5, $0A, $40, $00, $B5, $07, $64, $00, 
	$E5, $00, $40, $00, $C5, $42, $00, $B5, $65, $00, $00, $B5, $64, $00, $00, $B5, 
	$06, $0C, $00, $B5, $0A, $40, $00, $B5, $07, $64, $00, $E5, $00, $40, $00, $C5, 
	$42, $00, $B5, $65, $00, $00, $B5, $64, $00, $00, $B5, $06, $0C, $00, $B5, $0A, 
	$40, $00, $B5, $07, $64, $00, $E5, $00, $40, $00, $C5, $42, $00, $95, $45, $64, 
	$60, $85, $45, $40, $60, $95, $45, $64, $30, $85, $45, $40, $00, $95, $45, $64, 
	$18, $85, $45, $40, $00, $95, $45, $64, $18, $85, $45, $40, $00, $95, $43, $64, 
	$18, $85, $43, $40, $00, $95, $45, $64, $18, $85, $45, $40, $30, $95, $45, $64, 
	$60, $85, $45, $40, $60, $95, $45, $64, $30, $85, $45, $40, $00, $95, $45, $64, 
	$18, $85, $45, $40, $00, $95, $45, $64, $18, $85, $45, $40, $00, $95, $43, $64, 
	$18, $85, $43, $40, $00, $95, $45, $64, $18, $85, $45, $40, $30, $95, $45, $64, 
	$60, $85, $45, $40, $30, $95, $48, $64, $60, $85, $48, $40, $00, $95, $45, $64, 
	$30, $85, $45, $40, $30, $95, $43, $64, $30, $85, $43, $40, $00, $95, $43, $64, 
	$30, $85, $43, $40, $00, $95, $41, $64, $30, $85, $41, $40, $30, $95, $3E, $64, 
	$30, $85, $3E, $40, $00, $95, $3E, $64, $30, $85, $3E, $40, $00, $95, $40, $64, 
	$30, $85, $40, $40, $00, $95, $42, $64, $30, $85, $42, $40, $00, $95, $3E, $64, 
	$30, $85, $3E, $40, $00, $95, $45, $64, $60, $85, $45, $40, $60, $95, $45, $64, 
	$30, $85, $45, $40, $00, $95, $45, $64, $18, $85, $45, $40, $00, $95, $45, $64, 
	$18, $85, $45, $40, $00, $95, $43, $64, $18, $85, $43, $40, $00, $95, $45, $64, 
	$18, $85, $45, $40, $30, $95, $45, $64, $60, $85, $45, $40, $60, $95, $45, $64, 
	$30, $85, $45, $40, $00, $95, $45, $64, $18, $85, $45, $40, $00, $95, $45, $64, 
	$18, $85, $45, $40, $00, $95, $43, $64, $18, $85, $43, $40, $00, $95, $45, $64, 
	$18, $85, $45, $40, $30, $95, $45, $64, $60, $85, $45, $40, $30, $95, $48, $64, 
	$60, $85, $48, $40, $00, $95, $45, $64, $30, $85, $45, $40, $30, $95, $43, $64, 
	$30, $85, $43, $40, $00, $95, $43, $64, $30, $85, $43, $40, $00, $95, $41, $64, 
	$30, $85, $41, $40, $30, $95, $3E, $64, $30, $85, $3E, $40, $00, $95, $3E, $64, 
	$30, $85, $3E, $40, $00, $95, $40, $64, $30, $85, $40, $40, $00, $95, $42, $64, 
	$30, $85, $42, $40, $00, $95, $3E, $64, $30, $85, $3E, $40, $00, $B5, $65, $00, 
	$00, $B5, $64, $00, $00, $B5, $06, $0C, $00, $B5, $0A, $40, $00, $B5, $07, $64, 
	$00, $E5, $00, $40, $00, $C5, $42, $02, $B5, $65, $00, $00, $B5, $64, $00, $00, 
	$B5, $06, $0C, $00, $B5, $0A, $40, $00, $B5, $07, $64, $00, $E5, $00, $40, $00, 
	$C5, $42, $00, $B5, $65, $00, $00, $B5, $64, $00, $00, $B5, $06, $0C, $00, $B5, 
	$0A, $40, $00, $B5, $07, $64, $00, $E5, $00, $40, $00, $C5, $42, $00, $FF, $2F, 
	$00);

begin
  MIDISetPort($220 , 0);
  MIDIInit(6);
  while true do if MIDIStatus = 0 then MIDIPlay(@TrackData);
end.