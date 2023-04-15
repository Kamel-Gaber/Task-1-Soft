<!DOCTYPE html>
<html>
    <head>
        <title>Task-1</title>
    </head>
    <body>
        <h1>Task 1 in soft - 2 </h1>
        <h2>Students Name</h2>
        <ol>
            @foreach ($students as $student)
                <li>{{ $student }}</li>
            @endforeach
        </ol>
    </body>
</html>