# This file is the startpoint of the documentation and will describe an overview of the archticture the project

<details>

<summary>The models</summary>

All the models in this project are freezed data classes which are immutable, and also hive types so they can be stored in hive db.

### JuniorEmployee
#### Brief
This class represents a junior employee. A junior employee is a sub employee for a senior employee and gets tasks assigned automatically once assigned to their senior. A junior employee can be created in the app from a form that can be opened by naviagting to the employees section from the bottom bar and then tapping the add employee icon that will appear on the end of the appbar.
#### Structure
The junior employee contains the following properties:

* id: The id of the junior employee. This is required but nullable property and it will be filled while creating the employee's record in the db.
* name: The name of the junior employee. This is unnullable and it will be filled from the junior employee creation form.
* relatedTo: The id of the senior employee the junior employee is related to. This is nullable and will be filled after the employee gets assigned to a team.
* taskId: The id of the task assigned to the junior employee. This is nullable and will be filled after a task gets assigned to the employee.

### SeniorEmployee
#### Brief
This class represents a senior employee. A senior employee is an employee that has 3 sub employees of juniors. A senior employee cannot be inistiated unless it has at least 3 sub employees. A senior employee cannot be created through an interface in the app, it will be created from a junior employee once we have 4 junior employees that are not assigned to a team.
#### Structure
The senior employee contains the following properties:

* id: The id of the senior employee. This is a non nullable property, and it will be the same as the junior that this senior is transformed from.
* name: The name of the senior employee. This is a non unnullable property and it will be the same as the junior that this senior is transformed from.
* juniorIds: A list of ids of the junior employees that are related to this senior employee. This is a non nullable property and it will be filled with the ids of the 3 junior employees that are related to this senior employee.
* taskIds: A list of ids of the tasks assigned to this senior employee. This is a non nullable property and it will be filled with the ids of the tasks assigned to this senior employee or if none exist it can still be an empty list.

### Task
#### Brief
This class represents a task. A task is a task that is assigned to a senior employee and automatically assigned to one of their junior employees which does not already have a task assigned to them. A task can be created in the app from a form that can be opened by naviagting to the tasks section from the bottom bar and then tapping the add task icon that will appear on the end of the appbar.

#### Structure
The task contains the following properties:

* id: The id of the task. This is a non nullable property and it will be filled with the id of the task that is created in the db.
* name: The name of the task. This is a non unnullable property and it will be filled from the task creation form.
* description: The description of the task. This is a non unnullable property and it will be filled from the task creation form.

</details>

<details>

<summary>The data</summary>

This app uses Hive db to store its data, and the data flows as a `Stream` that listens to the Hive db into the app. an extra layer of `StreamProvider` is used to provide the data to the app because of the ease it provides to render the ui. 

Hive db uses its own magic internally, you do not have to worry about columns and rows like you would in a SQL db. this is great for such a minimal project, but in a bigger scale projects you will have to think about columns and rows.

</details>
