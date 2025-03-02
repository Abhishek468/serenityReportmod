<#macro reportData(reportData, number) >
    <script>
        function copyContent(id) {
            console.log("copy content of " + id);
            const content = document.getElementById(id).innerText;
            navigator.clipboard.writeText(content);
        }
    </script>

    <#if reportData.contents?has_content>
        <a name="${reportData.id}"></a>
        <span>
            <button type="button" class="btn btn-success btn-sm" data-toggle="collapse"
                    data-target="#reportData-${number}">
                ${reportData.title}
            </button>
        </span>
        <div class="rest-query-details">
            <div class="collapse multi-collapse" id="reportData-${number}" tabindex="-1" role="dialog"
                 aria-labelledby="restModalLabel" aria-hidden="true">
                <div class="card">
                    <h4 class="card-header" id="restModalLabel">
                        ${reportData.title}
                        <a role="button" class="btn btn-xs copy-button" onclick="copyContent('reportDataContent-${number}')">
                            <i class="bi bi-clipboard"></i>&nbsp;Copy
                        </a>
                    </h4>
                </div>
                <div class="card-body">
                      <style>
                        /* Apply styles only to tables inside the test step section */
                        #reportDataContent-${number} table {
                            border-collapse: collapse;
                            width: 100% !important;
                            font-family: Arial, sans-serif;
                            table-layout: fixed;
							font-size: 12px; 
                        }
                        #reportDataContent-${number} td {
                            border: 1px solid black;  /* Add black borders */
                            padding: 8px;             /* Add padding for spacing */
                            text-align: left;         /* Align text to the left */
                            min-width: 150px;        /* Ensure columns have minimum width */

                        }
                       
						/* Apply black background with white text for headers */
#reportDataContent-${number} th {
 text-align: left;         /* Align text to the left */
                            min-width: 150px;        /* Ensure columns have minimum width */
border: 1px solid black;  /* Add black borders */
                            padding: 8px;             /* Add padding for spacing */
    background-color: black; /* Black header background */
    color: white; /* White text */
    font-weight: bold;
    text-transform: uppercase; /* Optional: Makes headers uppercase */
}
                    </style>

                    <div id="reportDataContent-${number}">
                        ${(formatter.renderMarkdown(reportData.contents))!}
                    </div>
                </div>
            </div>
        </div>
    <#else>
        <span>
            <a role="button" class="btn btn-success btn-sm" href="${(reportData.path)!}">
                <i class="bi bi-download"></i>&nbsp;${reportData.title}
            </a>
        </span>
    </#if>
</#macro>
