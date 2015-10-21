import {{ project_package }}.api.{{ data_name}}Service;
import {{ project_package }}.api.datas.{{ data_name}}Data;
import {{ project_package }}.biz.dao.{{ data_name}}Dao;
import com.dianping.finance.common.aop.annotation.Log;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by {{ author }}
 */
public class {{ data_name}}ServiceObject implements {{ data_name}}Service {

    @Autowired
    {{ data_name}}Dao {{ data_name}}Dao;

    @Override
    @Log(logBefore = true, logAfter = true)
    public int insert{{ data_name}}({{ data_name}}Data data) {
        return {{ data_name}}Dao.insert{{ data_name}}(data);
    }

    @Override
    @Log(logBefore = true, logAfter = true)
    public {{ data_name}}Data load{{ data_name}}ById(int id) {
        return {{ data_name}}Dao.load{{ data_name}}ById(id);
    }

    @Override
    @Log(logBefore = true, logAfter = true)
    public int delete{{ data_name}}ById(int id) {
        return {{ data_name}}Dao.delete{{ data_name}}ById(id);
    }
}