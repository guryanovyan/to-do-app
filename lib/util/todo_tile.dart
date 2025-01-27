import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function (bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key, 
    required this.taskName, 
    required this.taskCompleted, 
    required this.onChanged,
    required this.deleteFunction
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),

      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade400,
              borderRadius: BorderRadius.circular(5),
            )
          ]
        ),

        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: taskCompleted ? Colors.yellow[200] : Colors.yellow[400],
            borderRadius: BorderRadius.circular(5),
          ),
          
          child: Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: taskCompleted, 
                  onChanged: onChanged,
                  activeColor: const Color.fromARGB(255, 70, 70, 70),
                ),
              ),
        
              Text(
                taskName, 
                style: TextStyle(
                  fontSize: 18,
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none  
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}