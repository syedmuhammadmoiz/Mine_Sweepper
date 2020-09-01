INCLUDE Irvine32.inc
INCLUDE Macros.inc
.data
count byte 0
welcome byte "Welcome to Minesweeper Game",0
scr byte "score = ",0
you byte "Your"
show byte 10 dup("*")
over byte "Game Over",0
winn byte "You Win",0
temp5 dword ?
var1 byte "e"
clm byte 1
endshow byte 10 dup("#")
enter1 byte "you press e ",0
enter2 byte "not compare",0
x byte 0
y byte 2
random dword ?
score dword 0
minex1 byte ?
miney1 byte ?
temp dword ?
umx1 byte ?
umy1 byte ?
dmx1 byte ?
dmy1 byte ?
rmx1 byte ?
rmy1 byte ?
lmx1 byte ?
lmy1 byte ?

minex2 byte ?
miney2 byte ?

umx2 byte ?
umy2 byte ?
dmx2 byte ?
dmy2 byte ?
rmx2 byte ?
rmy2 byte ?
lmx2 byte ?
lmy2 byte ?

.code
main proc
mov edx,offset welcome
call writestring 
call crlf
call crlf

call print
call print
call print
call print
call print
call print
call print
call print
call print
call print
mgotoxy x,y
call setmine1
call mines1
call setmine2
call mines2




loop1:
call run

loop loop1
call readdec

fin::
call quit
call waitmsg
exit
main endp

print proc
mov esi,offset show
mov ebx,1
mov ecx,10
loop1:
mov al,show
call writechar
mov al,' '
call writechar
mov al,' '
call writechar
loop loop1
call crlf
ret
print endp

endprint proc
mgotoxy 0,2
mov esi,offset endshow
mov ebx,1
mov ecx,10
mov eax,200
loop3:
mov temp5,ecx
mov ecx,28
loop2:
call delay
mov al,endshow
call writechar
loop loop2
call crlf
mov ecx,temp5
loop loop3
ret
endprint endp


run proc

call readchar
mov var1,al
cmp var1,'a'
je l1
cmp var1,'d'
je l2
cmp var1,'w'
je l3
cmp var1,'s'
je l4
cmp var1,'e'
je l5
jmp ot
l1:
cmp x,0
je li
sub x,3
mgotoxy x,y
li:
jmp ot

l2:
cmp x,27
je ll
add x,3
mgotoxy x,y
ll:
jmp ot

l3:
cmp y,2
je kl
sub y,1
mgotoxy x,y
kl:
jmp ot

l4:
cmp y,11
je ki
add y,1
mgotoxy x,y
ki:
jmp ot

l5:
inc count
.if count>98 
call win
.endif

mov bl,umx1
mov bh,umy1
.if bl==x
.if bh==y
mov eax,yellow
call SetTextColor
mov eax,9
call writedec
add score,eax
mov eax,white
call SetTextColor
jmp ot
.endif
.endif
mov bl,dmx1
mov bh,dmy1
.if bl==x
.if bh==y
mov eax,yellow
call SetTextColor
mov eax,9
call writedec
add score,eax
mov eax,white
call SetTextColor
jmp ot
.endif
.endif

mov bl,rmx1
mov bh,rmy1
.if bl==x
.if bh==y
mov eax,yellow
call SetTextColor
mov eax,9
call writedec
add score,eax
mov eax,white
call SetTextColor
jmp ot
.endif
.endif

mov bl,lmx1
mov bh,lmy1
.if bl==x
.if bh==y
mov eax,yellow
call SetTextColor
mov eax,9
call writedec
add score,eax
mov eax,white
call SetTextColor
jmp ot
.endif
.endif



mov bl,umx2
mov bh,umy2
.if bl==x
.if bh==y
mov eax,yellow
call SetTextColor
mov eax,9
call writedec
add score,eax
mov eax,white
call SetTextColor
jmp ot
.endif
.endif
mov bl,dmx2
mov bh,dmy2
.if bl==x
.if bh==y
mov eax,yellow
call SetTextColor
mov eax,9
call writedec
add score,eax
mov eax,white
call SetTextColor
jmp ot
.endif
.endif

mov bl,rmx2
mov bh,rmy2
.if bl==x
.if bh==y
mov eax,yellow
call SetTextColor
mov eax,9
call writedec
add score,eax
mov eax,white
call SetTextColor
jmp ot
.endif
.endif

mov bl,lmx2
mov bh,lmy2
.if bl==x
.if bh==y
mov eax,yellow
call SetTextColor
mov eax,9
call writedec
add score,eax
mov eax,white
call SetTextColor
jmp ot
.endif
.endif

mov bl,minex1
mov bh,miney1
.if bl==x
.if bh==y
mov eax,red
call SetTextColor
mov eax,'@'
call writechar
.if eax=='@'
jmp fin
.endif
jmp ot
.endif
.endif

mov bl,minex2
mov bh,miney2
.if bl==x
.if bh==y
mov eax,red
call SetTextColor
mov eax,'@'
call writechar
.if eax=='@'
jmp fin
.endif
jmp ot
.endif
.endif


mov eax,green
call SetTextColor
mov eax,7
call randomrange
mgotoxy x,y

call writedec
add score,eax
mov eax,white
call SetTextColor


ot:
ret
run endp

setmine1 proc
mov eax,4
call RandomRange
call randomrange
cmp eax,0
je l0
cmp eax,1
je l3
cmp eax,2
je l6
cmp eax,3
je l9
l0:
mov minex1,0
jmp mid
l3:
mov minex1,3
jmp mid
l6:
mov minex1,6
jmp mid
l9:
mov minex1,9
jmp mid
mid:
mov eax,10
call randomrange
call randomrange
call randomrange
mov temp,eax
mov al,byte ptr temp 
mov miney1,al

ret
setmine1 endp

mines1 proc

mov bl,minex1
mov umx1,bl
mov al,0
mov al,miney1
sub al,1
mov umy1,al

mov bl,0
mov bl,minex1
mov dmx1,bl
mov al,miney1
add al,1
mov dmy1,al

mov bl,0
mov bl,minex1
add bl,3
mov rmx1,bl
mov al,miney1
mov rmy1,al

mov bl,0
mov bl,minex1
sub bl,3
mov lmx1,bl
mov al,miney1
mov lmy1,al;


ret
mines1 endp

setmine2 proc
mov eax,10
call RandomRange
cmp eax,0
je l0
cmp eax,1
je l3
cmp eax,2
je l6
cmp eax,3
je l9
l0:
mov minex2,18
jmp mid
l3:
mov minex2,21
jmp mid
l6:
mov minex2,24
jmp mid
l9:
mov minex2,27
jmp mid
mid:
mov eax,11
call randomrange
mov temp,eax
mov al,byte ptr temp 
mov miney2,al
ret
setmine2 endp

mines2 proc
mov bl,0
mov bl,minex2
mov umx2,bl
mov al,miney2
sub al,1
mov umy2,al


mov bl,0
mov bl,minex2
mov dmx2,bl
mov al,miney2
add al,1
mov dmy2,al


mov bl,0
mov bl,minex2
add bl,3
mov rmx2,bl
mov al,miney2
mov rmy2,al


mov bl,0
mov bl,minex2
sub bl,3
mov lmx2,bl
mov al,miney2
mov lmy2,al


ret
mines2 endp

quit proc
mov eax,1000
call delay
call endprint
call clrscr
mov eax,white
call SetTextColor
mgotoxy 50,15
mov edx,offset over
call writestring
call crlf
mgotoxy 50,18
mov edx,offset scr
call writestring
mov eax,score
call writedec
mov eax,1000

call delay

call crlf
call crlf
call crlf
call crlf
call crlf
ret
quit endp

win proc
mov edx,offset winn
call writestring
call quit
ret 
win endp
end main