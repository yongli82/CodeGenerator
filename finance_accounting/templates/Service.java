import {{ project_package }}.api.datas.{{ data_name}}Data;

import java.util.List;

/**
 * Created by {{ author }}
 */
public interface {{ data_name }}Service {

    int insert{{ data_name }}({{ data_name }}Data data);

    {{ data_name }}Data load{{ data_name }}ById(int id);

    int delete{{ data_name }}ById(int id);

}