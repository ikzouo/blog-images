

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.alibaba.excel.annotation.write.style.HeadFontStyle;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class TcmSliceExcelTemplate implements Serializable {


    
    /**
     *主键
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("主键")
    private Long id;

    
    /**
     *药材名称
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("药材名称")
    private String name;

    
    /**
     *中药药片类型  1: 中药饮片 2: 中草药
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("中药药片类型  1: 中药饮片 2: 中草药")
    private Integer type;

    
    /**
     *数据类型 1: 公共 2:私有
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("数据类型 1: 公共 2:私有")
    private Integer dataType;

    
    /**
     *炮制方法
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("炮制方法")
    private String processing;

    
    /**
     *贮藏
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("贮藏")
    private String storage;

    
    /**
     *性状
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("性状")
    private String phenotypicTrait;

    
    /**
     *化学成分
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("化学成分")
    private String ingredients;

    
    /**
     *功能主治
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("功能主治")
    private String indications;

    
    /**
     *用法用量
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("用法用量")
    private String usageDosage;

    
    /**
     *来源
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("来源")
    private String source;

    
    /**
     *原形态
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("原形态")
    private String protomorphic;

    
    /**
     *毒性
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("毒性")
    private String toxicity;

    
    /**
     *药理作用
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("药理作用")
    private String pharmaco;

    
    /**
     *药性
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("药性")
    private Integer drugProperties;

    
    /**
     *出处
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("出处")
    private String provenance;

    
    /**
     *注意事项
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("注意事项")
    private String mattersNeedingAttention;

    
    /**
     *创建人
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("创建人")
    private String createdBy;

    
    /**
     *创建时间
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("创建时间")
    private Date createdAt;

    
    /**
     *修改人
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("修改人")
    private String changedBy;

    
    /**
     *修改时间
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("修改时间")
    private Date changedAt;

    
    /**
     *是否删除 0:正常 1:删除
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("是否删除 0:正常 1:删除")
    private Integer delFlag;

    
    /**
     *版本号
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("版本号")
    private Integer version;

    
    /**
     *医疗目录编码
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("医疗目录编码")
    private String medicalDirectoryNumber;

    
    /**
     *医药机构目录编码
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("医药机构目录编码")
    private String directoryInstitutionsNumber;

    
    /**
     *his_id
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("his_id")
    private String hisId;

    
    /**
     *药品本位码
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("药品本位码")
    private String standardCode;

    
    /**
     *价格
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("价格")
    private Integer defaultPrice;

    
    /**
     *助记码
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("助记码")
    private String mnemonicCode;

    
    /**
     *价格
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("价格")
    private Integer price;

    
    /**
     *his编码
     */
    @HeadFontStyle(color = 10)
    @ColumnWidth(20)
    @ExcelProperty("his编码")
    private String hisCode;
    
}