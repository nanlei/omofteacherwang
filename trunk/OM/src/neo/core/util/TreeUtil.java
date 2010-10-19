package neo.core.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TreeUtil {

	private static final String SPLIT = " &gt ";//子类与父类间的分隔符
	private static final int ID_LENGTH = 3;//类标识长度

	public static List setFullName(List list, String id, String name) {
		int listSize = list.size();
		if (listSize > 0) {
			Map m = new HashMap();
			for (int i = 0; i < listSize; i++) {
				Map item = (Map) list.get(i);
				String tmpId = (String) item.get(id);
				m.put(tmpId, item.get(name));
				StringBuffer fullName = new StringBuffer();
				for (int j = 1; j <= tmpId.length() / ID_LENGTH; j++) {
					String pId = tmpId.substring(0, j * ID_LENGTH);
					fullName.append(SPLIT);
					fullName.append((String) m.get(pId));
				}
				item.put("FULL" + name, fullName.toString());
				
				
			}
			m = null;
		}

		return list;
	}
}