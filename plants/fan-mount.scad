// Размеры
slot_width = 25.2; // Ширина паза
slot_height = 5;   // Высота ребра
wall_thickness = 1; // Толщина стенок

// Функция для паза
module slot() {
    difference() {
        // Внешний корпус паза
        cube([25.2,25.2,30]);

        // Внутренний вырез для ребра
        translate([-1, wall_thickness, 1]) 
        cube([25.2*3,25.2-2,30]);
        //cube([slot_width, slot_height, wall_thickness]);
    }
}

// Вызов функции для визуализации
slot();


        // Внешний корпус паза
        translate([0,0,-10]) cube([25.2,1,30]);
   
        translate([0,5.2,-10]) cube([25.2,1,10.9]);

