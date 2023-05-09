# README

## Task

Use Ruby on Rails to build a project conversation history. A user should be able to:

- leave a comment
- change the status of the project

The project conversation history should list comments and changes in status.

Please don’t spend any more than 3 hours on this task.


## Questions

1. Is user registration and authentication required? If so, can you provide more details on the authentication requirements and user roles?

  Response:
    No, this is an proof of concept and we are only interested into exploring how to implment project comments and status changes.

2. Could you provide more information on how the status of the project should be changed?
  Are there any specific statuses that need to be included?
  Are there rules for status transition?

  Response:
    Projects have three different statuses: "In progress", "Completed" or "Cancelled".
    The user should be able to change the status of the project from the project conversation history page.
    There are no rules for status changes in this first version.

3. How should the comments and status changes be displayed on the project conversation history page?

  Response:
    The comments and status changes should be displayed in reverse chronological order, with the most recent displayed at the top of the page.
    Each comment should include date and time the comment was made, and the actual comment text.
    Each status change should include the date and time the status was changed, the previous status and the new status.

4. Should users be able to edit or delete comments?

  Response:
    No, users should not be able to edit or delete comments

5. Is there a limit to the number of items that can be displayed on the project conversation history page?

  Response:
    There is no limit to the number of items that can be displayed on the project conversation history page.
    No, pagination is needed for now.

6. Should there be any restrictions on who can leave comments or change the status of the project?

  Response:
    No, every user should be able to leave comments or change the status of any given project.

7. Should users be notified when a new comment is added or when the status of the project is changed?

  Response:
    Yes, users could be notified through email or other means when a new comment is added or when the status of the project is changed.
    However, we will implement this feature as a following epic/iteration after adding user authentication.

8. Can you provide any design specifications for the project conversation history page?

  Response:
    The design of the project conversation history page should be consistent with the rest of the application.
    The page should be easy to read, accessible and responsive.
    Comments and status change should be displayed as a list of events listed in reverse chronological order.
    We can discuss the design in more detail and come up with a mockup or wireframe.

9. Other frontend application, mobile applications or backend services will consume this data?
  Should we expose a JSON api (for example)?

  Response:
    No, we don't need it yet. Only our application frontend will consume this data.


## Models

* Activity
* Comment
* Project
* StatusChange

## Configuration

Install dependencies with `bundle install`

Setup database `rails db:setup`

## Test

Run test suite

```
  rspec
```

## Start application (development server)

```
  bin/dev
```
