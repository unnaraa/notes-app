import 'package:flutter/material.dart';
import 'package:notes_app/draw/color_picker.dart';
import 'package:notes_app/draw/drawing_point.dart';
import 'package:notes_app/draw/drawing_pointer.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  bool isDrawingMode = false;
  bool showDrawingTools = false;
  Color selectedColor = Colors.white;
  double strokeWidth = 3.0;
  List<DrawingPoint?> drawingPoints = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
        ),
        title: TextField(
          controller: _titleController,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Title',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white, size: 24),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white, size: 24),
            onSelected: (value) {},
            itemBuilder:
                (BuildContext context) => [
                  const PopupMenuItem(value: 'Share', child: Text('Share')),
                  const PopupMenuItem(value: 'Delete', child: Text('Delete')),
                ],
          ),
        ],
      ),
      body: Stack(
        children: [
          if (!isDrawingMode)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _contentController,
                style: const TextStyle(color: Colors.white),
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Write your note here...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          if (isDrawingMode)
            GestureDetector(
              onPanStart: (details) {
                setState(() {
                  drawingPoints.add(
                    DrawingPoint(
                      paint:
                          Paint()
                            ..color = selectedColor
                            ..strokeCap = StrokeCap.round
                            ..strokeWidth = strokeWidth,
                      point: details.localPosition,
                    ),
                  );
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  drawingPoints.add(
                    DrawingPoint(
                      paint:
                          Paint()
                            ..color = selectedColor
                            ..isAntiAlias = true
                            ..strokeCap = StrokeCap.round
                            ..strokeWidth = strokeWidth,
                      point: details.localPosition,
                    ),
                  );
                });
              },
              onPanEnd: (details) {
                setState(() {
                  drawingPoints.add(
                    null,
                  ); // Add a null point to indicate the end of the line
                });
              },
              child: CustomPaint(
                painter: DrawingPainter(drawingPoints: drawingPoints),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showDrawingTools)
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                border: Border(
                  top: BorderSide(color: Colors.grey[800]!, width: 0.5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.brush,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () {
                        setState(() {
                          isDrawingMode = true;
                          showDrawingTools = false;
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.undo,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () {
                        setState(() {
                          isDrawingMode = false;
                          showDrawingTools = false;
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () {
                        setState(() {
                          drawingPoints.clear();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          if (isDrawingMode)
            ColorPickerWidget(
              selectedColor: selectedColor,
              onColorSelected: (color) {
                setState(() {
                  selectedColor = color;
                });
              },
              onClear: () {
                setState(() {
                  drawingPoints.clear();
                });
              },
            ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              border: Border(
                top: BorderSide(color: Colors.grey[800]!, width: 0.5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.check_box_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.text_fields,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        isDrawingMode = false;
                        showDrawingTools = true;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.draw,
                      color: isDrawingMode || showDrawingTools ? Colors.blue : Colors.white,
                      size: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        showDrawingTools = !showDrawingTools;
                        if (!showDrawingTools) {
                          isDrawingMode = false;
                        }
                      });
                    },
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}