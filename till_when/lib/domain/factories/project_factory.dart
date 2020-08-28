import 'package:till_when/domain/models/project.dart';
import 'package:till_when/domain/repositories/project_repository.dart';

class ProjectFactory {
  ProjectRepository _projectRepository;

  ProjectFactory(this._projectRepository);
  
  Future<Project> make(String name) async {
    var highestPriorityInRepo = await _projectRepository.getHighestProjectPriority();
    
    return Project(name: name, priority: highestPriorityInRepo);
  }
}