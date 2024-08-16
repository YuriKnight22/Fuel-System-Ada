pragma SPARK_Mode (On);

with fuel;
use fuel;



procedure Main
is
begin
   Init;
   loop
      pragma Loop_Invariant (ISS (FFS) AND ISS2 (FFS) AND ISS3 (FFS));
      RF;
      MFS;
      PS;
   end loop;
end Main;

      
