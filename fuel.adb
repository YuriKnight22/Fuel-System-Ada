pragma SPARK_Mode (On);

with AS_IO_Wrapper;  use AS_IO_Wrapper; 



package body fuel is
   
   procedure RF is
      Fuel: Integer;
      Fuel2: Integer;
      Fuel3: Integer;
      FlightType: Integer;  -- Updated to track flight type using integers

   begin
      AS_Put_Line("Start from Europe");

      -- First flight from Europe to Asia
      FlightType := 1;
      AS_Put_Line("Please type the fuel you want for your flight from Europe to Asia?");
      AS_Put_Line("Please type from 1001 between 2000");
      loop
         AS_Get(Fuel, "Please type again");
         exit when (Fuel >= 0 and Fuel <= 2000);
         AS_Put_Line("Please type in a value between 1001 and 2000");
         AS_Put_Line("");
      end loop;
      FFS.FM := Fuel_R(Fuel);
      
      -- Check if the fuel is above a critical threshold
      if Integer(FFS.FM) > FRC then
         FFS.SFS := ON;
      else
         FFS.SFS := OFF;
      end if;
      -- Display the system status after the flight
      if FFS.SFS = ON then
         AS_Put_Line("The system is currently ON after the flight from " & Integer'Image(FlightType));
   
      else
         AS_Put_Line("The system is currently OFF after the flight from " & Integer'Image(FlightType));

      end if;

      -- Second flight from Asia to Oceanic
      FlightType := 2;
      AS_Put_Line("Please type the necessary fuel you want for your flight from Asia to Oceanic?");
      AS_Put_Line("Please type from 2001 between 3500");
      loop
         AS_Get(Fuel2, "Please type again");
         exit when (Fuel2 >= 0 and Fuel2 <= 3500);
         AS_Put_Line("Please type in a value between 2001 and 3500");
         AS_Put_Line("");
      end loop;
      FFS.FM2 := Fuel_R2(Fuel2);
      
      -- Check if the fuel is above a critical threshold
      if Integer(FFS.FM2) > FRC then
         FFS.SFS := ON;
      else
         FFS.SFS := OFF;
      end if;

      if FFS.SFS = ON then
         AS_Put_Line("The system is currently ON after the flight from " & Integer'Image(FlightType));
        
      else
         AS_Put_Line("The system is currently OFF after the flight from " & Integer'Image(FlightType));
     
      end if;

      -- Third Flight from Oceanic to Asia
      FlightType := 3;
      AS_Put_Line("Please type the necessary fuel you want for your flight from Oceanic to America?");
      AS_Put_Line("For Oceanic flights please type from 3500 between 5000");
      loop
         AS_Get(Fuel3, "Please type again");
         exit when (Fuel3 >= 0 and Fuel3 <= 5000);
         AS_Put_Line("Please type in a value between 3501 and 5000");
         AS_Put_Line("");
      end loop;
      FFS.FM3 := Fuel_R3(Fuel3);
      
      -- Check if the fuel is above a critical threshold
      if Integer(FFS.FM3) > FRC then
         FFS.SFS := ON;
      else
         FFS.SFS := OFF;
      end if;
      
      -- Display the system status after the flight
      if FFS.SFS = ON then
         AS_Put_Line("The system is currently ON after the flight from " & Integer'Image(FlightType));
     
      else
         AS_Put_Line("The system is currently OFF after the flight from " & Integer'Image(FlightType));
       
      end if;

   end RF;

   -- prints out the fuel status 
   procedure PS is
   begin
      AS_Put("Fuel Status = ");
      AS_Put(Integer(FFS.FM));
      AS_Put_Line("");
      AS_Put("Plane_System = ");
      AS_Put_Line(SFSTS(FFS.SFS));

      AS_Put("Fuel Status 2nd flight = ");
      AS_Put(Integer(FFS.FM2));
      AS_Put_Line("");
      AS_Put("Plane_System 2nd flight = ");
      AS_Put_Line(SFSTS(FFS.SFS));

      AS_Put("Fuel Status 3rd flight = ");
      AS_Put(Integer(FFS.FM3));
      AS_Put_Line("");
      AS_Put("Plane_System 3rd flight = ");
      AS_Put_Line(SFSTS(FFS.SFS));
   end PS;

   -- Monitor the fuel status after each flight and activate the system if necessary
   procedure MFS is
   begin
      if Integer(FFS.FM) > FRC then
         FFS.SFS := ON;
      else
         FFS.SFS := OFF;
      end if;
      
       if Integer(FFS.FM2) > Integer(FFS.FM) then
         FFS.SFS := ON;
      else
         FFS.SFS := OFF;
      end if;
      
       if Integer(FFS.FM3) > Integer(FFS.FM2) then
         FFS.SFS := ON;
      else
         FFS.SFS := OFF;
      end if;
   end MFS;

   -- Initialize the system
   procedure Init is
   begin
      AS_Init_Standard_Input;
      AS_Init_Standard_Output;
      FFS := (FM => 0, FM2 => 0, FM3 => 0, SFS => OFF);
   end Init;

   -- Convert the fuel system status to a string
   function SFSTS (SFS   : Status_Fuel_T) return String is
   begin
      if SFS = ON then
         return "Plane System ON";
      else
         return "Plane System OFF";
      end if;
   end SFSTS;


end fuel;




