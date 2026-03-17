<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .flash-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.4);
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 999;

        transition: opacity 0.3s ease;
    }

    .flash-card{
        background:white;
        padding:30px;
        border-radius:12px;
        width:350px;
        text-align:center;
        box-shadow:0 5px 25px rgba(0,0,0,0.2);
        animation:fadeIn 0.3s ease;
    }

    .flash-title{
        margin-bottom:10px;
    }

    .flash-error .flash-title{
        color:#dc3545;
    }

    .flash-success .flash-title{
        color:#28a745;
    }

    .flash-message{
        margin-bottom:20px;
        color:#333;
    }
    .flash-btn{
        padding:10px 20px;
        border:none;
        background:#2f60d3;
        color:white;
        border-radius:6px;
        cursor:pointer;
        transition:0.2s ease;
    }

    .flash-btn:hover{
        background:#254db3;
    }
    @keyframes fadeIn{
        from{transform:scale(0.8); opacity:0;}
        to{transform:scale(1); opacity:1;}
    }
</style>

<c:if test="${not empty errorMessage or not empty successMessage}">
    
    <div class="flash-overlay">
        <div class="flash-card ${not empty errorMessage ? 'flash-error' : 'flash-success'}">

            <h3 class="flash-title">
                <c:choose>
                    <c:when test="${not empty errorMessage}">
                        Oops!
                    </c:when>
                    <c:otherwise>
                        Success!
                    </c:otherwise>
                </c:choose>
            </h3>

            <p class="flash-message">
                <c:out value="${not empty errorMessage ? errorMessage : successMessage}"/>
            </p>

            <button class="flash-btn" onclick="closeFlash()">OK</button>

        </div>

    </div>

</c:if>

<script>
function closeFlash(){
    const el = document.querySelector('.flash-overlay');
    if(el){
        el.style.opacity = '0';  
        setTimeout(() => el.remove(), 300);
    }
}

window.onload = function () {
    const el = document.querySelector('.flash-overlay');

    if(el){
        setTimeout(() => {
            el.style.opacity = '0'; 
            setTimeout(() => el.remove(), 300);
        }, 2500);
    }
};
</script>