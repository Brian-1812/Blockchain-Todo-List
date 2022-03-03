// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Todo {
  // constructor() public {
  // }
  struct Task {
    uint id;
    uint date;
    string name;
    bool completed;
    string content;
  }

  mapping(address => Task[]) tasks;

  function _createTask(address _owner, string memory _name, string memory _content) internal {
    tasks[_owner].push(Task({
      id: tasks[_owner].length,
      date: block.timestamp,
      name: _name,
      completed: false,
      content: _content
    }));
  }

  function _getTasks(address _owner) internal view returns (Task[] memory) {
    return tasks[_owner];
  }

  function _getTask(address _owner, uint _id) internal view returns (Task memory) {
    return tasks[_owner][_id];
  }

  function createTask(string memory _name, string memory _content) public {
    _createTask(msg.sender, _name, _content);
  }

  function getTasks() public view returns (Task[] memory) {
    return _getTasks(msg.sender);
  }

  function getTask(uint _id) public view returns (Task memory) {
    return _getTask(msg.sender, _id);
  }

  function updateTask(uint _id) public {
    tasks[msg.sender][_id].completed = !tasks[msg.sender][_id].completed;
  }

  function deleteTask(uint _id) public {
   delete tasks[msg.sender][_id];
  }
}
