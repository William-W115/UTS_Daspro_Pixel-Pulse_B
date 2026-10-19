program ParkirMallSederhana;

{ Sistem Parkir Mall Otomatis Sederhana
  Fitur: kendaraan masuk, kendaraan keluar, status parkir }

const
  KAPASITAS = 10;

var
  pilihan, jenis, i : integer;
  jam               : integer;
  mobil, motor      : integer;
  biaya, pendapatan : integer;

begin
  mobil      := 0;
  motor      := 0;
  pendapatan := 0;

  repeat
    writeln('=== PARKIR MALL OTOMATIS ===');
    writeln('1. Kendaraan Masuk');
    writeln('2. Kendaraan Keluar');
    writeln('3. Status Parkir');
    writeln('0. Keluar');
    write('Pilih menu: ');
    readln(pilihan);
    writeln;

    case pilihan of

      { ----- MENU 1: KENDARAAN MASUK ----- }
      1: begin
           write('Jenis (1=Mobil, 2=Motor): ');
           readln(jenis);
           if jenis = 1 then
           begin
             if mobil < KAPASITAS then
             begin
               mobil := mobil + 1;
               writeln('Mobil masuk. Sisa slot: ', KAPASITAS - mobil);
             end
             else
               writeln('Parkir mobil penuh!');
           end
           else if jenis = 2 then
           begin
             if motor < KAPASITAS then
             begin
               motor := motor + 1;
               writeln('Motor masuk. Sisa slot: ', KAPASITAS - motor);
             end
             else
               writeln('Parkir motor penuh!');
           end
           else
             writeln('Jenis tidak valid!');
         end;

      { ----- MENU 2: KENDARAAN KELUAR ----- }
      2: begin
           write('Jenis (1=Mobil, 2=Motor): ');
           readln(jenis);
           if (jenis <> 1) and (jenis <> 2) then
             writeln('Jenis tidak valid!')
           else if ((jenis = 1) and (mobil = 0)) or
                   ((jenis = 2) and (motor = 0)) then
             writeln('Tidak ada kendaraan tersebut di parkiran!')
           else
           begin
             while true do
             begin
               write('Lama parkir (jam): ');
               readln(jam);
               if jam >= 1 then
                 break;
               writeln('Minimal 1 jam, silakan ulangi!');
             end;

             if jenis = 1 then
             begin
               biaya := 5000 + (jam - 1) * 3000;
               mobil := mobil - 1;
             end
             else
             begin
               biaya := 2000 + (jam - 1) * 1000;
               motor := motor - 1;
             end;

             writeln('Total biaya: Rp ', biaya);
             pendapatan := pendapatan + biaya;
           end;
         end;

      { ----- MENU 3: STATUS PARKIR ----- }
      3: begin
           write('Mobil : ');
           for i := 1 to KAPASITAS do
           begin
             if i <= mobil then
               write('[X]')
             else
               write('[ ]');
           end;
           writeln;

           write('Motor : ');
           for i := 1 to KAPASITAS do
           begin
             if i <= motor then
               write('[X]')
             else
               write('[ ]');
           end;
           writeln;
           writeln('Total pendapatan: Rp ', pendapatan);
         end;

      0: writeln('Terima kasih!');

    else
      writeln('Menu tidak valid!');
    end;

    writeln;
  until pilihan = 0;
end.